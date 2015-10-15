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
    
    init(members : [Person]) {
        self.members = members
    }
    
    func householdIncome() -> Double {
        var result : Double
        for var i : Int = 0; i < members.count; i++ {
            result += members[i].job.salary
        }
        return result
    }
    
    func haveChild(newPerson: Person) -> Void {
        newPerson.age = 0
        var count = 0
        for var i : Int = 0; i < members.count; i++ {
            if members[i].age > 21 {
                count++
            }
        }
        if count >= 1 {
            members.append(newPerson)
        }
    }
}