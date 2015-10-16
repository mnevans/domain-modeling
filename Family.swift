//
//  Family.swift
//  domain-modeling.swift
//
//  Created by Morgan Evans on 10/14/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import Foundation

class Family {
    var members = [Person?]()
    
    init(members : [Person?]) {
        self.members = members
    }
    
    func householdIncome(totalHours: Double) -> Double {
        var result = 0.0
        for member in members {
            if member!.job != nil {
                result += member!.job!.calculateIncome(totalHours)
            }
        }
        return result
    }
    
    func haveChild() -> Void {
        let newPerson = Person(firstName: "New", lastName: "Born", age: 0, spouse: nil, job: nil)
        var count = 0
        for member in members {
            if member!.age > 21 {
                count++
            }
        }
        if count >= 1 {
            members.append(newPerson)
        }
    }
}

