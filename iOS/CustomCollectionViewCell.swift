//
//  CustomCollectionViewCell.swift
//  Weather App
//
//  Created by Ananya Sharma on 20/11/19.
//  Copyright © 2019 Ananya Sharma. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
  
  // MARK: - IBOutlets
  @IBOutlet weak var topView: UIView!
  @IBOutlet weak var middleStackView: UIStackView!
  @IBOutlet weak var bottomTableView: UITableView!
  @IBOutlet weak var topViewCityName: UILabel!
  @IBOutlet weak var topViewSummary: UILabel!
  @IBOutlet weak var topViewTemprature: UILabel!
  @IBOutlet weak var topViewImage: UIImageView!
  @IBOutlet weak var humidityLbl: UILabel!
  @IBOutlet weak var windSpeedLbl: UILabel!
  @IBOutlet weak var visibilityLbl: UILabel!
  @IBOutlet weak var pressureLbl: UILabel!
  
  // MARK: - Variabels
  var modelData: CurrentDataModel? = nil
  let formater = DateFormatter()
  let timeFormatter = DateFormatter()
  
  // MARK: - LifeCycle Methods
  override func awakeFromNib() {
    timeFormatter.dateFormat = "HH:mm"
    formater.dateFormat = "dd/MM/yyyy"
  }
}

// MARK: - TableView Extention
extension CustomCollectionViewCell: UITableViewDelegate,
UITableViewDataSource {
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return 7
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView
      .dequeueReusableCell(withIdentifier: "customTableViewCell") as? CustomTableViewCell {
      if let modelData = modelData {
        let dateTime = modelData.next7DaysData[indexPath.row+1].time
        let timeInterval = TimeInterval(exactly: Double(dateTime) ?? 0)
        let date = Date(timeIntervalSince1970: timeInterval!)
        let dateString = formater.string(from: date)
        let icon = Utility.setupTopViewImage(icon: modelData.next7DaysData[indexPath.row+1].icon)
        
        cell.dateLbl.text = dateString
        cell.weatherConditionImage.image = icon
        
        let sunSetTime = modelData.next7DaysData[indexPath.row+1].sunsetTime
        let sunSetTimeInterval = TimeInterval(exactly: Double(sunSetTime) ?? 0)!
        let sunSetTimeString = timeFormatter.string(from: Date(timeIntervalSince1970: sunSetTimeInterval))
        
        let sunRiseTime = modelData.next7DaysData[indexPath.row+1].sunriseTime
        let sunRiseTimeInterval = TimeInterval(exactly: Double(sunRiseTime) ?? 0)!
        let sunRiseTimeString = timeFormatter.string(from: Date(timeIntervalSince1970: sunRiseTimeInterval))
        
        cell.sunriseTime.text = sunRiseTimeString
        cell.sunsetTime.text = sunSetTimeString
        cell.weatherConditionImage.image = Utility.setupTopViewImage(icon: modelData.next7DaysData[indexPath.row+1].icon)
      }
      return cell
    } else {
      return UITableViewCell()
    }
  }
}
