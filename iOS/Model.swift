//
//  Model.swift
//  Weather App
//
//  Created by Ananya Sharma on 27/11/19.
//  Copyright © 2019 Ananya Sharma. All rights reserved.
//

import Foundation
import  SwiftyJSON

struct CurrentDataModel {
  let time: String
  let summary: String
  let icon: String
  let temperature: String
  let humidity: String
  let pressure: String
  let windSpeed: String
  let visibility: String
  let next7DaysData: [Next7DaysData]
  var dataArray: [Next7DaysData] = []
  let precipitation: CGFloat
  let cloudCover: String
  let oZone: String
  let weeklysummary: String
  let weeklyIcon: String
  
  init(json: JSON) {
    let currently = json["currently"]
    self.time = currently["time"].stringValue
    self.summary = currently["summary"].stringValue
    self.icon = currently["icon"].stringValue
    self.temperature = String(currently["temperature"].stringValue.prefix(5)) + " °F"
    self.humidity = currently["humidity"].stringValue.prefix(4) + " %"
    self.pressure = currently["pressure"].stringValue + " mb"
    self.windSpeed = currently["windSpeed"].stringValue.prefix(3) + " mph"
    self.visibility = currently["visibility"].stringValue.prefix(3) + " km"
    self.precipitation = CGFloat(currently["precipIntensity"].floatValue * 25.4) 
    self.cloudCover = currently["cloudCover"].stringValue + " %"
    self.oZone = currently["ozone"].stringValue + " DU"
    self.weeklysummary = json["daily"]["summary"].stringValue
    self.weeklyIcon = json["daily"]["icon"].stringValue
    let itemsArray = json["daily"]["data"].arrayValue
    for item in itemsArray {
      let sevenDayModel = Next7DaysData(json: item)
      dataArray.append(sevenDayModel)
    }
    self.next7DaysData = dataArray
    print(self.next7DaysData)
  }
}

struct Next7DaysData {
  let time: String
  let summary: String
  let icon: String
  let sunriseTime: String
  let sunsetTime: String
  let tempHigh: Float
  let tempLow: Float
  init(json: JSON) {
    print(json)
    self.time = json["time"].stringValue
    self.summary = json["summary"].stringValue
    self.icon = json["icon"].stringValue
    self.sunriseTime = json["sunriseTime"].stringValue
    self.sunsetTime = json["sunsetTime"].stringValue
    self.tempHigh = json["temperatureHigh"].float!
    self.tempLow = json["temperatureLow"].float!
  }
}
