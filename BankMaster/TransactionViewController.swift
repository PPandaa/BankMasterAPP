//
//  TransactionViewController.swift
//  FinalProject
//
//  Created by PeterHu on 2019/1/2.
//  Copyright © 2019 PeterHu. All rights reserved.
//

import UIKit
class TransactionViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    var myBank = [Bank]()
    var selectBankIndex:Int?
    @IBOutlet weak var bankMoney: UILabel!
    @IBOutlet weak var howMuch: UITextField!
    @IBOutlet weak var transactionState: UISegmentedControl!
    @IBOutlet weak var bankPicker: UIPickerView!
    @IBOutlet weak var bankButton: UIButton!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myBank.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myBank[row].bankName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectBankIndex = row
        let selectBank = myBank[row]
        bankMoney.text = String(selectBank.money)
        if transactionState.selectedSegmentIndex == 0{
            let result = "存入 $ " + howMuch.text!
            bankButton.setTitle(result, for: .normal)
        }
        else{
            let result = "支出 $ " + howMuch.text!
            bankButton.setTitle(result, for: .normal)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        checkTransactionState(state: transactionState.selectedSegmentIndex)
        bankPicker.delegate = self
        if let bank = Bank.read(){
            myBank = bank
        }
        let pick = bankPicker.selectedRow(inComponent: 0)
        bankMoney.text = String(myBank[pick].money)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        let state = transactionState.selectedSegmentIndex
        let executeMoney = Int(howMuch.text!)
        let executeBank =  selectBankIndex
        if state == 0 {
            myBank[executeBank!].money += executeMoney!
        }
        else{
            myBank[executeBank!].money -= executeMoney!
        }
        Bank.save(bank: myBank)
    }
    @IBAction func transactionState(_ sender: Any) {
        checkTransactionState(state: transactionState.selectedSegmentIndex)
    }
    
    func checkTransactionState(state:Int) {
        if  state == 0 {
            bankButton.setTitle("存入", for: .normal)
        }
        else{
            bankButton.setTitle( "支出", for: .normal)
        }
        howMuch.text = ""
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
