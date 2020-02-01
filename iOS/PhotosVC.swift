//
//  PhotosVC.swift
//  Weather App
//
//  Created by Ananya Sharma on 29/11/19.
//  Copyright © 2019 Ananya Sharma. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftSpinner

class PhotosVC: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var photo1: UIImageView!
  @IBOutlet weak var photo2: UIImageView!
  
  // MARK: - Varibels
  var id = ""
  // MARK: - LifeCycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    SwiftSpinner.show("Loading Photos")
    setupPhotos()
  }
  //Setup Photos
  func setupPhotos() {
    APIManager.shared.makePhotosRequest(id: id) { (response, messgage) in
      if let data = response?["items"].arrayValue {
        let photo1url = data[0]["link"].stringValue
        let photo2url = data[1]["link"].stringValue
        if let x = URL(string: photo1url) {
          self.photo1.load(url: x)
        }
        if let y = URL(string: photo2url) {
          self.photo2.load(url: y)
        }
      }
      SwiftSpinner.hide()
    }
  }
}

extension UIImageView {
  func load(url: URL) {
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        }
      }
    }
  }
}
