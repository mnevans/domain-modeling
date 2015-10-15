//
//  Job.swift
//  domain-modeling.swift
//
//  Created by Morgan Evans on 10/14/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import Foundation

class Job {
    var title : String
    var salary : Int
    
    init(title: String, salary: Int) {
        self.title = title
        self.salary = salary
    }
    
    func calculateIncome(hours: Int) -> Int {
        return salary * hours
    }
    
    func raise(var percentage: Int) -> Double {
        percentage /= 100
        return Double(salary * percentage)
    }
}