//
//  NewBankViewController.swift
//  FinalProject
//
//  Created by PeterHu on 2019/1/4.
//  Copyright © 2019 PeterHu. All rights reserved.
//

import UIKit

class NewBankViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet weak var money: UITextField!
    @IBOutlet weak var bank: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    var pickBank: String?
    var pickBankShortName: String?
    var total: Bank?
    let bankList = ["私房錢",
                "Chase 大通銀行",
                "Citi Bank 花旗銀行",
                "HSBC Bank 滙豐銀行",
                "E.SUN Bank 玉山銀行",
                "First Bank 第一銀行",
                "Taishin Bank 台新銀行",
                "Fubon Bank 富邦銀行",
                "Chang Hwa Bank 彰化銀行",
                "Land Bank 土地銀行",
                "Cathay United Bank 國泰世華銀行"]
    let shortName = ["私房錢",
                     "大通銀行",
                     "花旗銀行",
                     "滙豐銀行",
                     "玉山銀行",
                     "第一銀行",
                     "台新銀行",
                     "富邦銀行",
                     "彰化銀行",
                     "土地銀行",
                     "國泰世華銀行"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bankList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bankList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickBank = bankList[row]
        pickBankShortName = shortName[row]
        imageView.image = UIImage(named: pickBank!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bank.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let inputMoney = Int(money.text!)
        total = Bank(bankName:pickBank!,bankShortName:pickBankShortName!, money:inputMoney!)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var result = true
        if money.text?.isEmpty == true  {
            result = false
            
            let alertController = UIAlertController(title: "Error", message: "Please insert how much money you have", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        return result
    }
}
