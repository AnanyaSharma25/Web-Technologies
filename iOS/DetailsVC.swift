//
//  DetailsVC.swift
//  Weather App
//
//  Created by Ananya Sharma on 21/11/19.
//  Copyright © 2019 Ananya Sharma. All rights reserved.
//

import UIKit
import Toast_Swift

class DetailsVC: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var topView: UIView!
  @IBOutlet weak var topViewTemprature: UILabel!
  @IBOutlet weak var topViewSummary: UILabel!
  @IBOutlet weak var topViewCityName: UILabel!
  @IBOutlet weak var humidityLbl: UILabel!
  @IBOutlet weak var windSpeedLbl: UILabel!
  @IBOutlet weak var visibilityLbl: UILabel!
  @IBOutlet weak var pressureLbl: UILabel!
  @IBOutlet weak var bottomTableView: UITableView!
  
  // MARK: - Variabels
  var data: CurrentDataModel?
  var selectedCityName: String?
  var bottomTableViewData = [Next7DaysData]()
  var xx = "ffevv"
  var sendData = true
  // MARK: - LifeCycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Custom Methods
  func setupUI() {
    topView.layer.borderWidth = 1
    topView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    if let data = data {
      topViewTemprature.text = data.temperature
      topViewSummary.text = data.summary
      humidityLbl.text = data.humidity
      windSpeedLbl.text = data.windSpeed
      visibilityLbl.text = data.visibility
      pressureLbl.text = data.pressure
      topViewCityName.text = selectedCityName
      bottomTableView.reloadData()
      self.title = selectedCityName
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "twitter"),
      style: .plain,
      target: self,
      action: #selector(handelRightBarButtonItem))
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToTabBar" {
      if let tabVC = segue.destination as? UITabBarController {
        tabVC.title = selectedCityName
        if let todayVC = tabVC.viewControllers![0] as? TodayVC {
          todayVC.data = self.data
        }
        if let weeklyVC = tabVC.viewControllers![1] as? WeeklyVC {
          weeklyVC.data = self.data
        }
        if let photosVC = tabVC.viewControllers![2] as? PhotosVC {
          photosVC.id = (self.topViewCityName.text?.replacingOccurrences(of: " ", with: ""))!
        }
      }
    }
  }
  
  @objc func handelRightBarButtonItem() {
       guard let url = URL(string: "https://twitter.com") else { return }
       UIApplication.shared.open(url)
     }
  
  // MARK: - IBActions
  @IBAction func addPressed(_ sender: UIButton) {
    
    if sendData {
    sender.setImage(UIImage(named: "trash-can"), for: .normal)
    self.view.makeToast("\(topViewCityName.text!) was added to your Favourite List",duration: 0.7) { (_) in
      if let mainVC = self.navigationController?.viewControllers[0] as? ViewController {
        mainVC.modelData.append(self.data!)
        mainVC.mainCollectionView.reloadData()
        mainVC.addedCityName.append(self.topViewCityName.text!)
      }
    }
      sendData = false
    } else {
      sendData = true
      sender.setImage(UIImage(named: "plus-circle"), for: .normal)
      self.view.makeToast("\(topViewCityName.text!) has been removed from your Favourite List",duration: 0.7) { (_) in
         if let mainVC = self.navigationController?.viewControllers[0] as? ViewController {
           mainVC.modelData.removeLast()
         }
       }
    }
  }
}

// MARK: - TableView Extention
extension DetailsVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let x = data?.next7DaysData.count {
      return x - 1
    } else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "detalisVCTableViewCell") as? DetailsVCTableViewCell {
      
      let formater = DateFormatter()
      let timeFormatter = DateFormatter()
      
      timeFormatter.dateFormat = "HH:mm"
      formater.dateFormat = "dd/MM/yyyy"
      
      if let data = data {
        let dateTime = data.next7DaysData[indexPath.row+1].time
        let timeInterval = TimeInterval(exactly: Double(dateTime) ?? 0)
        let date = Date(timeIntervalSince1970: timeInterval!)
        let dateString = formater.string(from: date)
        cell.dateLbl.text = dateString
        
        let icon = Utility.setupTopViewImage(icon: data.next7DaysData[indexPath.row].icon)
        
        let sunSetTime = data.next7DaysData[indexPath.row+1].sunsetTime
        let sunSetTimeInterval = TimeInterval(exactly: Double(sunSetTime) ?? 0)!
        let sunSetTimeString = timeFormatter.string(from: Date(timeIntervalSince1970: sunSetTimeInterval))
        
        let sunRiseTime = data.next7DaysData[indexPath.row+1].sunriseTime
        let sunRiseTimeInterval = TimeInterval(exactly: Double(sunRiseTime) ?? 0)!
        let sunRiseTimeString = timeFormatter.string(from: Date(timeIntervalSince1970: sunRiseTimeInterval))
        
        cell.icon.image = icon
        cell.sunriseTime.text = sunRiseTimeString
        cell.sunsetTime.text = sunSetTimeString
        
      }
      return cell
    } else {
      return UITableViewCell()
    }
  }
}
