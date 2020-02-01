//
//  ViewController.swift
//  Weather App
//
//  Created by Ananya Sharma on 20/11/19.
//  Copyright © 2019 Ananya Sharma. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var searchTableView: UITableView!
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var mainCollectionView: UICollectionView!
  
  // MARK: - Varibles
  var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: UIScreen.main.bounds.width - 90,
                                                         height: 20))
  var rightNavBarButton: UIBarButtonItem?
  var locationManager = CLLocationManager()
  var autoCompleteResults = [String]()
  var autoCompletePlaceID = [String]()
  let geocoder = CLGeocoder()
  var currentLocation = ""
  var currentLocationData: JSON?
  var modelData = [CurrentDataModel]()
  var selectedCityData: CurrentDataModel?
  var selectedCityName: String?
  var addedCityName = [String]()
  
  // MARK: - Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    pageControl.numberOfPages = modelData.count
  }
  
  // MARK: - Custom Methods
  func setupUI() {
    searchBar.placeholder = "Enter City Name ..."    
    let leftNavBarButton = UIBarButtonItem(customView: searchBar)
    self.navigationItem.leftBarButtonItem = leftNavBarButton
    
    rightNavBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "temperature-celsius"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(handelRightBarButtonItem))
    
    rightNavBarButton!.tintColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    searchBar.delegate = self
    self.navigationItem.rightBarButtonItem = rightNavBarButton    
    searchTableView.layer.maskedCorners = [.layerMinXMaxYCorner,
                                           .layerMaxXMaxYCorner]
    
    pageControl.numberOfPages = 1
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    locationManager.requestAlwaysAuthorization()
    if CLLocationManager.locationServicesEnabled(){
      locationManager.startUpdatingLocation()
    }
    SwiftSpinner.show("Fetching Weather Details for Current Location",
                      animated: true)
  }
  
  
  // MARK: - Handeling Convert To Ferhanite
  @objc func handelRightBarButtonItem() {
    if rightNavBarButton!.image == #imageLiteral(resourceName: "temperature-celsius") {
      rightNavBarButton!.image = #imageLiteral(resourceName: "temperature-fahrenheit")
    } else {
      rightNavBarButton?.image = #imageLiteral(resourceName: "temperature-celsius")
    }
  }
  
  func makeRequestForAutoComplete(searchInput: String) {    
    APIManager.shared.makeRequestForAutoComplete(searchInput: searchInput) { (response, message) in
      if let json = response {
        self.autoCompleteResults = []
        self.autoCompletePlaceID = []
        DispatchQueue.main.async {
          for item in json["predictions"].arrayValue {
            self.autoCompleteResults.append(item["description"].stringValue)
            self.autoCompletePlaceID.append(item["place_id"].stringValue)
          }
          self.searchTableView.reloadData()
        }
      }
    }
  }
  
  
  func makeCurrentLocationRequest(userLocation: CLLocation) {
    locationManager.stopUpdatingLocation()
    APIManager.shared
      .makeLocationRequest(userLocation: userLocation) { [unowned self] (response, message) in
        if let current = response {
          self.modelData.append(current)
          self.pageControl.numberOfPages = self.modelData.count
          SwiftSpinner.hide()
          self.mainCollectionView.reloadData()
        } else {
          self.currentLocationData = JSON()
        }
    }
  }
  
  func setupCell(cell: CustomCollectionViewCell, indexPath: IndexPath) {
    cell.modelData = modelData[indexPath.row]
    if indexPath.row == 0 {
      cell.topViewCityName.text = currentLocation
    } else  {
      cell.topViewCityName.text = addedCityName[indexPath.row-1]
      
    }
    cell.topViewSummary.text = modelData[indexPath.row].summary
    cell.topViewTemprature.text = modelData[indexPath.row].temperature
    
    if let image = Utility.setupTopViewImage(icon: modelData[indexPath.row].icon) {
      cell.topViewImage.image = image
    }
    
    cell.humidityLbl.text = modelData[indexPath.row].humidity
    cell.windSpeedLbl.text = modelData[indexPath.row].windSpeed
    cell.visibilityLbl.text = modelData[indexPath.row].visibility
    cell.pressureLbl.text = modelData[indexPath.row].pressure
    
    cell.bottomTableView.reloadData()
  }
}

// MARK: - CollectionView Delegate
extension ViewController: UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return modelData.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell",
                                                     for: indexPath) as? CustomCollectionViewCell {
      cell.topView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
      setupCell(cell: cell, indexPath: indexPath)
      
      cell.topView.layer.borderWidth = 1
      return cell
    } else {
      return UICollectionViewCell()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    //Correction in Size
    return CGSize(width: 375 ,
                  height: 689.7)
  }
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
  }
}

// MARK: - TableView Delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return autoCompleteResults.count
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "seachTableViewCell") as? SearchTableViewCell {
      if autoCompleteResults.count != 0 {
        cell.cityNameLabel.text = autoCompleteResults[indexPath.row]
      }
      return cell
    } else {
      return UITableViewCell()
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    searchTableView.isHidden = true
    
    searchBar.text = ""
    searchBar.resignFirstResponder()
    selectedCityName = autoCompleteResults[indexPath.row].components(separatedBy: ",")[0]
    SwiftSpinner.show("Fetching Weather Details for \(selectedCityName!) ...", animated: true)
    
    APIManager.shared.callDetailsAPI(id: autoCompletePlaceID[indexPath.row]) { (response, message) in
      if let json = response {
        let location = json["result"]["geometry"]["location"]
        let latInDouble = Double(location["lat"].stringValue) ?? 0
        let lngDouble = Double(location["lng"].stringValue) ?? 0
        let latDegrees = CLLocationDegrees(exactly: latInDouble)
        let lngDegrees = CLLocationDegrees(exactly: lngDouble)
        let coordinates = CLLocation(latitude: latDegrees!, longitude: lngDegrees!)
        APIManager.shared.makeLocationRequest(userLocation: coordinates) { (response, message) in
          self.selectedCityData = response
          SwiftSpinner.hide()
          self.performSegue(withIdentifier: "sendToDetailsVC", sender: self)
        }
      }
    }
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "sendToDetailsVC" {
      let detailsVC = segue.destination as? DetailsVC
      autoCompleteResults.removeAll()
      autoCompletePlaceID.removeAll()
      detailsVC?.selectedCityName = selectedCityName
      detailsVC?.data = selectedCityData
      
    }
    if segue.identifier == "goToTabBarDirectly" {
      if let tabVC = segue.destination as? UITabBarController {
        tabVC.title = currentLocation
        let sender = sender as! UIButton
        let point = sender.convert(sender.bounds.origin, to: mainCollectionView)
        let index = mainCollectionView.indexPathForItem(at: point)
        if let todayVC = tabVC.viewControllers![0] as? TodayVC {
          todayVC.data = self.modelData[index!.row]
        }
        if let weeklyVC = tabVC.viewControllers![1] as? WeeklyVC {
          weeklyVC.data = self.modelData[index!.row]
        }
        if let photosVC = tabVC.viewControllers![2] as? PhotosVC {
          if let cell = mainCollectionView.cellForItem(at: index!) as? CustomCollectionViewCell {
            photosVC.id = (cell.topViewCityName.text?.replacingOccurrences(of: " ", with: ""))!
          }
        }
      }
    }
  }
}

// MARK: - UISearchBar Extention
extension ViewController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText.count >= 1 {
      searchTableView.isHidden = false
      makeRequestForAutoComplete(searchInput: searchText)
    } else {
      searchTableView.isHidden = true
    }
  }
  
  func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
    autoCompleteResults.removeAll()
    autoCompletePlaceID.removeAll()
    return true
  }
}

// MARK: - CoreLocation Extention
extension ViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager,
                       didUpdateLocations locations: [CLLocation]) {
    let userLocation: CLLocation = locations[0] as CLLocation
    geocoder.reverseGeocodeLocation(userLocation) { (placemark, error) in
      self.currentLocation = (placemark?[0].locality)!
      self.makeCurrentLocationRequest(userLocation: userLocation)
      self.mainCollectionView.reloadData()
    }
  }
}
