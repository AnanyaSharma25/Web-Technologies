//
//  APIManager.swift
//  Weather App
//
//  Created by Ananya Sharma on 26/11/19.
//  Copyright © 2019 Ananya Sharma. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import CoreLocation

class APIManager {
  private let GOOGLEAPIKEY = "AIzaSyDUBvO8VCCnNLWXySDg0PofWYG4qiQQwoU"
  private let DARKSKYAPIKEY = "9d3b21d1c7b3d785adde8e89d9506e8a"
  private let CUSTOMSEARCHAPIKEY = "014853519819696149007:8qlxefjlhsz"
  static let shared = APIManager()
  
  func makeRequestForAutoComplete(searchInput: String,
                                  completion: @escaping (JSON?, Int?) -> Void) {
    
    let modifiedInput = searchInput
      .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    if let url = URL(string: "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(modifiedInput)&types=(cities)&language=en&key=\(GOOGLEAPIKEY)") {
      Alamofire.request(url).responseJSON { (response) in
        if response.result.isSuccess {
          if let data = JSON(rawValue: response.result.value ?? JSON()) {
            completion(data, response.response?.statusCode)
          }
        } else {
          completion(nil, response.response?.statusCode)
        }
      }
    }
  }
  
  func makeLocationRequest(userLocation: CLLocation,
                                  completion: @escaping (CurrentDataModel?, Int?) -> Void) {
    if let url = URL(string: "https://api.darksky.net/forecast/\(DARKSKYAPIKEY)/\(userLocation.coordinate.latitude),\(userLocation.coordinate.longitude)") {
      Alamofire.request(url).responseJSON { (response) in
        if response.result.isSuccess {
          if let data = JSON(rawValue: response.result.value ?? JSON()) {
            let data2 = CurrentDataModel(json: data)
            completion(data2, response.response?.statusCode)
          }
        } else {
          completion(nil, response.response?.statusCode)
        }
      }
    }
  }
  
  func callDetailsAPI(id: String, completion: @escaping (JSON?, Int?) -> Void) {
    if let url = URL(string: "https://maps.googleapis.com/maps/api/place/details/json?place_id=\(id)&fields=geometry&key=\(GOOGLEAPIKEY)") {
      Alamofire.request(url).responseJSON { (response) in
        if response.result.isSuccess {
          if let data = JSON(rawValue: response.result.value ?? JSON()) {
            completion(data, response.response?.statusCode)
          }
        } else {
          completion(nil, response.response?.statusCode)
        }
      }
    }
  }
  func makePhotosRequest(id: String, completion: @escaping (JSON?, Int?) -> Void) {
    if let url = URL(string: "https://www.googleapis.com/customsearch/v1?q=\(id)&cx=\(CUSTOMSEARCHAPIKEY)&num=2&searchType=image&key=\(GOOGLEAPIKEY)") {
      print(url)
      Alamofire.request(url).responseJSON { (response) in
        if let data = JSON(rawValue: response.result.value ?? JSON()) {
          completion(data, response.response?.statusCode)
        } else {
          completion(nil, response.response?.statusCode)
        }
      }
    }
  }
}
//https://www.googleapis.com/customsearch/v1?q=newyork&cx=&num=1&searchType=image&key=AIzaSyDUBvO8VCCnNLWXySDg0PofWYG4qiQQwoU


