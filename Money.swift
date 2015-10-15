//
//  Money.swift
//  domain-modeling.swift
//
//  Created by Morgan Evans on 10/14/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import Foundation

struct Money {
    
    //standard properties
    var amount : Double
    var currency : String
    
    // initialize property variables
    init(amount: Double, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    
    // convert the previous currency to USD
    func convert (sum: Double, previousCurrency: String, newCurrency: String) -> Money? {
        let num = Money(amount: sum, currency: previousCurrency)
        let numUSD = convertUSD(num)
        if numUSD == nil {
            return nil
        } else {
            let amountUSD = Money(amount: numUSD!, currency: "USD")
            let amountOther = convertOther(amountUSD, type: newCurrency)
            if amountOther == nil {
                return nil
            } else {
                return Money(amount: amountOther!, currency: newCurrency)
            }
        }
    }
    
    // convert the amount of money to USD
    private func convertUSD(num: Money) -> Double? {
        switch num.currency.uppercaseString {
        case "USD":
            return num.amount
        case "GBP":
            return num.amount * 2
        case "EUR":
            return (num.amount * 2) / 3
        case "CAN":
            return (num.amount * 4) / 5
        default:
            print("Please enter a valid currency to convert to.")
            return 0
        }
    }
    
    // convert the amount of money to something other than USD
    private func convertOther(num: Money, type: String) -> Double? {
        switch type.uppercaseString {
        case "USD":
            return num.amount
        case "GBP":
            return num.amount / 2
        case "EUR":
            return num.amount * 1.5
        case "CAN":
            return num.amount * 1.25
        default:
            print("Please enter a valid currency to convert to.")
            return 0
        }
    }
    
    // add two amounts of currency (USD) together
    func add(firstAmount: Money, secondAmount: Money) -> Money? {
        let first = convert(firstAmount.amount, previousCurrency: firstAmount.currency, newCurrency: "USD")
        let second = convert(secondAmount.amount, previousCurrency: secondAmount.currency, newCurrency: "USD")
        if first == nil || second == nil {
            return nil
        } else {
            let sumUSD = Money(amount: first!.amount + second!.amount, currency: "USD")
            let sumOther = convertOther(sumUSD, type: secondAmount.currency)
            if sumOther == nil {
                return nil
            } else {
                return Money(amount: sumOther!, currency: secondAmount.currency)
            }
        }
    }
    
    // subtract two amount of currency (USD) from one another
    func subtract(firstAmount: Money, secondAmount: Money) -> Money? {
        let first = convert(firstAmount.amount, previousCurrency: firstAmount.currency, newCurrency: "USD")
        let second = convert(secondAmount.amount, previousCurrency: secondAmount.currency, newCurrency: "USD")
        if first == nil || second == nil {
            return nil
        } else {
            let sumUSD = Money(amount: first!.amount - second!.amount, currency: "USD")
            let sumOther = convertOther(sumUSD, type: secondAmount.currency)
            if sumOther == nil {
                return nil
            } else {
                return Money(amount: sumOther!, currency: secondAmount.currency)
            }
        }
    }
}