//
//  PieChartViewController.swift
//  BankMaster
//
//  Created by PeterHu on 2019/1/12.
//  Copyright © 2019 PeterHu. All rights reserved.
//

import UIKit
import Charts

class PieChartViewController: UIViewController {
    
    var myBank = [Bank]()
    var money = 0
    var colors = [UIColor]()
    var number = 0.0
    @IBOutlet weak var pieChartView: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setChart()
    }
    func setChart() {
        if let bank = Bank.read(){
            myBank = bank
            for bank in myBank {
                money += Int(bank.money)
            }
        }
        var dataEntries = [PieChartDataEntry]()
        for i in myBank {
            let dataEntry = PieChartDataEntry()
            dataEntry.value = Double(i.money)
            dataEntry.label = i.bankShortName
            dataEntries.append(dataEntry)
            let color = UIColor(red: CGFloat(Float.random(in: 0...0.5))   , green: CGFloat(Float.random(in: 0.5...1)), blue: CGFloat(Float.random(in: 0.5...1)), alpha:1)
            colors.append(color)
        }
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: nil)
        pieChartDataSet.colors = colors
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        pieChartView.backgroundColor = UIColor(red: 168/255, green: 230/255, blue: 207/255, alpha: 1)
    }
    override func viewDidAppear(_ animated: Bool) {
        setChart()
    }
}
