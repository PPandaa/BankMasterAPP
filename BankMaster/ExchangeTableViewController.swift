//
//  ExchangeTableViewController.swift
//  FinalProject
//
//  Created by PeterHu on 2019/1/7.
//  Copyright © 2019 PeterHu. All rights reserved.
//

import UIKit

class ExchangeTableViewController: UITableViewController {
    
    @IBOutlet weak var US: UILabel!
    @IBOutlet weak var GB: UILabel!
    @IBOutlet weak var AUS: UILabel!
    @IBOutlet weak var EU: UILabel!
    @IBOutlet weak var JP: UILabel!
    @IBOutlet weak var time: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let urlStr = "https://tw.rter.info/capi.php".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            
            let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                if let data = data, let Results = try? decoder.decode(result.self, from: data) {
                    DispatchQueue.main.async {
                        self.US.text = String(Int(Results.USDTWD.Exrate))
                        let GBP = Int(Results.USDTWD.Exrate/Results.USDGBP.Exrate)
                        self.GB.text = String(GBP)
                        let AUD = Int(Results.USDTWD.Exrate/Results.USDAUD.Exrate)
                        self.AUS.text = String(AUD)
                        let EUR = Int(Results.USDTWD.Exrate/Results.USDEUR.Exrate)
                        self.EU.text = String(EUR)
                        let JPY = Int(Results.USDJPY.Exrate/Results.USDTWD.Exrate)
                        self.JP.text = String(JPY)
                        self.time.text = "匯率更新時間\n"+Results.USDTWD.UTC
                    }
                }
            }
            task.resume()
        }
    }
}
