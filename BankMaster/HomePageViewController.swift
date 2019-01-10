//
//  HomePageViewController.swift
//  FinalProject
//
//  Created by PeterHu on 2019/1/2.
//  Copyright © 2019 PeterHu. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var goal: UILabel!
    @IBOutlet weak var totalSaving: UIButton!
    var myBank = [Bank]()
    override func viewDidLoad() {
        super.viewDidLoad()
        RefreshSaving()
    }
    func RefreshSaving()  {
        var money = 0
        if let bank = Bank.read(){
           myBank = bank
            for bank in myBank {
                money += Int(bank.money)
            }
            let temp = (Float(money)/1000000.0)
            let margin = 100.0*temp
            let moneyString = "$ "+String(money)
            totalSaving.setTitle(moneyString,for: .normal)
            let str = NSString(format:"%.1f",margin)
            goal.text = (str as String)+" %"
        }
        
        
       
    }
    @IBAction func RButton(_ sender: Any) {
        let alertController = UIAlertController(title: "目標", message: "TWD $1000000", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        RefreshSaving()
    }
    @IBAction func unwindToHomePage(_ unwindSegue: UIStoryboardSegue) {
        RefreshSaving()
        // Use data from the view controller which initiated the unwind segue
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
