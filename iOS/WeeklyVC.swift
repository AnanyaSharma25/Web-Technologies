//
//  WeeklyVC.swift
//  Weather App
//
//  Created by Ananya Sharma on 21/11/19.
//  Copyright © 2019 Ananya Sharma. All rights reserved.
//

import UIKit
import Charts

class WeeklyVC: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var topView: UIView!
  @IBOutlet weak var summary: UILabel!
  @IBOutlet weak var icon: UIImageView!
  @IBOutlet weak var chartView: LineChartView!
  
  // MARK: - Variabels
  var data: CurrentDataModel?
  var line1Data = [ChartDataEntry]()
  var line2Data = [ChartDataEntry]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - LifeCycle Methods
  func setupUI() {
    topView.layer.borderWidth = 1
    topView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    summary.text = data?.weeklysummary
    icon.image = Utility.setupTopViewImage(icon: data?.weeklyIcon)
    setupChart()
  }
  
  //Setup Chart
  func setupChart() {
    for i in 0..<7 {
      let x = data?.next7DaysData[i].tempLow
      let y = data?.next7DaysData[i].tempHigh
      let data1 = ChartDataEntry(x: Double(i), y: Double(x!))
      let data2 = ChartDataEntry(x: Double(i), y: Double(y!))
      line1Data.append(data1)
      line2Data.append(data2)
    }
    let line1 = LineChartDataSet(entries: line1Data, label: "Minimum Temprature °F")
    let line2 = LineChartDataSet(entries: line2Data, label: "Maximum Temprature °F")
    line1.colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    line2.colors = [#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)]
    line1.circleColors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    line2.circleColors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    line1.circleRadius = 4
    line2.circleRadius = 4
    line1.lineWidth = 2
    line2.lineWidth = 2
    let data = LineChartData(dataSets: [line1, line2])
    chartView.data = data
  }
}
