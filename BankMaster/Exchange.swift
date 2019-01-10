//
//  Exchange.swift
//  FinalProject
//
//  Created by PeterHu on 2019/1/7.
//  Copyright © 2019 PeterHu. All rights reserved.
//

import Foundation

struct exchange: Codable {
    var Exrate: Float
    var UTC: String 
}

struct result: Codable {
    var USDTWD: exchange
    var USDGBP: exchange
    var USDAUD: exchange
    var USDEUR: exchange
    var USDJPY: exchange
}
