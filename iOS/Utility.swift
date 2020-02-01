//
//  Utility.swift
//  Weather App
//
//  Created by Ananya Sharma on 29/11/19.
//  Copyright © 2019 Ananya Sharma. All rights reserved.
//

import UIKit

struct Utility {
  
  static func setupTopViewImage(icon: String?) -> UIImage? {
    switch icon {
    case "clear-day":
      return UIImage(named: "weather-sunny")
    case "clear-night":
      return UIImage(named: "weather-night")
    case "rain":
      return UIImage(named: "weather-rainy")
    case "snow":
      return UIImage(named: "weather-snowy")
    case "wind":
      return UIImage(named: "weather-windy")
    case "fog":
      return UIImage(named: "weather-fog")
    case "cloudy":
      return UIImage(named: "weather-cloudy")
    case "partly-cloudy-day":
      return UIImage(named: "weather-partly-cloudy")
    case "partly-cloudy-night":
      return UIImage(named: "weather-night-partly-cloudy")
    default:
      return UIImage()
    }
  }
}
