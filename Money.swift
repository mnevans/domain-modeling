//
//  Money.swift
//  domain-modeling.swift
//
//  Created by Morgan Evans on 10/15/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import Foundation

protocol Mathematics {
    var add : Bool { get }
    var subtract : Bool { get }
}

struct Money: CustomStringConvertible, Mathematics {
    var description: String { return "\(currency) \(amount)" }
    let add = true //?
    let subtract = true //?
    var amount : Double
    var currency : String
    
    func convert(newCurr: String) -> Money {
        var conversion = Money(amount: self.amount, currency: newCurr)
        switch self.currency {
        case "USD":
            if newCurr == "GBP" {
                conversion.amount *= 0.5
            } else if newCurr == "EUR" {
                conversion.amount *= 1.5
            } else if newCurr == "CAN" {
                conversion.amount *= 1.25
            }
        case "GBP":
            if newCurr == "EUR" {
                conversion.amount *= 3
            } else if newCurr == "CAN" {
                conversion.amount *= 2.5
            }
        case "EUR":
            if newCurr == "CAN" {
                conversion.amount *= (5/6)
            }
        default:
            conversion.amount = self.amount
            conversion.currency = self.currency
        }
    return conversion
    }
    
    func add(secondAmount: Money) -> Money {
        var result = Money(amount: Double(), currency: String())
        result = convert(secondAmount.currency)
        result.amount += secondAmount.amount
        return result
    }
    
    func subtract(secondAmount: Money) -> Money {
        var result = Money(amount: Double(), currency: String())
        result = convert(secondAmount.currency)
        result.amount -= secondAmount.amount
        return result
    }
}

