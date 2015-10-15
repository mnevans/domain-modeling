//
//  Person.swift
//  domain-modeling.swift
//
//  Created by Morgan Evans on 10/14/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import Foundation

class Person {
    let firstName : String
    let lastName : String
    var age : Int
    var spouse : Person?
    var job : Job?
    
    init(firstName: String, lastName: String, age: Int, spouse: Person?, job: Job?) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        
        if age >= 16 {
            self.job = job
        } else {
            self.job = nil
        }
        if age >= 18 {
            self.spouse = spouse
        } else {
            self.spouse = nil
        }
    }
    
    func toString() -> String {
        if (job == nil && spouse == nil) {
            return ("Name: \(firstName) + \(lastName). Age: \(age). They are unemployed and single! How sad.")
        } else if (job == nil && spouse != nil) {
            return ("Name: \(firstName) + \(lastName). Age: \(age). Job: Unemployed. Spouse: \(spouse!.firstName).")
        } else if (job != nil && spouse == nil) {
            return ("Name: \(firstName) + \(lastName). Age: \(age). Job: \(job!.title). Single.")
        } else {
            return ("Name: \(firstName) + \(lastName). Age: \(age). Job: \(job!.title). Spouse: \(spouse!.firstName). Both employed AND married, how exciting!")
        }
    }
}