//
//  bank.swift
//  FinalProject
//
//  Created by PeterHu on 2019/1/4.
//  Copyright © 2019 PeterHu. All rights reserved.
//

import Foundation

struct Bank:Codable {
    var bankName: String
    var bankShortName: String
    var money: Int
    static func read() -> [Bank]? {
        if let data = UserDefaults.standard.data(forKey: "bank"), let bank = try? PropertyListDecoder().decode([Bank].self, from: data) {
            return bank
        } else {
            return nil
        }
    }
    
    static func save(bank: [Bank]) {
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(bank) {
            UserDefaults.standard.set(data, forKey: "bank")
            
        }
    }
}
