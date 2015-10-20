//
//  Double.swift
//  domain-modeling.swift
//
//  Created by Morgan Evans on 10/20/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import Foundation

extension Double {
    var USD: Money { return Money(amount: self, currency: "USD") }
    var GBP: Money { return Money(amount: self, currency: "GBP") }
    var EUR: Money { return Money(amount: self, currency: "EUR") }
    var CAN: Money { return Money(amount: self, currency: "CAN") }
}