//
//  TodayVC.swift
//  Weather App
//
//  Created by Ananya Sharma on 21/11/19.
//  Copyright © 2019 Ananya Sharma. All rights reserved.
//

import UIKit

class TodayVC: UIViewController {

  // MARK: - IBOutlets
  @IBOutlet var dataViews: [UIView]!
  @IBOutlet weak var windSpeed: UILabel!
  @IBOutlet weak var pressure: UILabel!
  @IBOutlet weak var precipitation: UILabel!
  @IBOutlet weak var temprature: UILabel!
  @IBOutlet weak var humidity: UILabel!
  @IBOutlet weak var visibility: UILabel!
  @IBOutlet weak var cloudCover: UILabel!
  @IBOutlet weak var oZone: UILabel!
  @IBOutlet weak var icon: UIImageView!
  @IBOutlet weak var summary: UILabel!
  
  // MARK: - Variabels
  var data: CurrentDataModel?
  
  // MARK: - LifeCycle Function
  override func viewDidLoad() {
        super.viewDidLoad()
    setupUI()
    }
  
  // MARK: - Custom Methods
  func setupUI() {
    for i in 0..<dataViews.count {
      dataViews[i].layer.borderWidth = 1
      dataViews[i].layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    if let data = data {
      windSpeed.text = data.windSpeed
      pressure.text = data.pressure
      let x = String(format: "%.2f" , String(describing: data.precipitation))
    precipitation.text = "\(x) mmph"
      temprature.text = data.temperature
      humidity.text = data.humidity
      visibility.text = data.visibility
      cloudCover.text = data.cloudCover
      oZone.text = data.oZone
      icon.image = Utility.setupTopViewImage(icon: data.icon) 
      summary.text = data.summary
    }
  }
}
