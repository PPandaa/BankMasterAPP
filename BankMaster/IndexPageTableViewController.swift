//
//  IndexPageTableViewController.swift
//  FinalProject
//
//  Created by PeterHu on 2019/1/1.
//  Copyright © 2019 PeterHu. All rights reserved.
//

import UIKit

class IndexPageTableViewController: UITableViewController {
    var mybank = [Bank]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let bank = Bank.read(){
            mybank = bank
        }
       
    }
    @IBAction func unwindToIndexPage(_ unwindSegue: UIStoryboardSegue) {
        if let controller = unwindSegue.source as? NewBankViewController,let bank = controller.total{
            mybank.insert(bank, at: 0)
            Bank.save(bank: mybank)
            tableView.reloadData()
        }
        
        
        // Use data from the view controller which initiated the unwind segue
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mybank.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankTableViewCell", for: indexPath) as! BankTableViewCell
        
        // Configure the cell...
        let bank = mybank[indexPath.row]
        cell.bankLabel.text = bank.bankName
        cell.moneyLabel.text = "$ "+String(bank.money)
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
    override func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath)
        -> [UITableViewRowAction]?{
            var actionArr:Array<UITableViewRowAction> = [UITableViewRowAction]()
            
            // 建立刪除按鈕
            let actionDelete:UITableViewRowAction =
                UITableViewRowAction(style: UITableViewRowAction.Style.normal,
                                     title: "刪除") { (action, indexPath) in
                                        let select:Int = indexPath.row
                                        self.mybank.remove(at: select)
                                        Bank.save(bank: self.mybank)
                                        tableView.isEditing = false // 退出刪除模式
                                        tableView.reloadData() // 更新tableView
            }
            // 將按鈕動作加入Array，並回傳
            actionDelete.backgroundColor = .red
            actionArr.append(actionDelete)
            
            return actionArr
    }
}
