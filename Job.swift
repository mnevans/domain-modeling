//
//  Job.swift
//  domain-modeling.swift
//
//  Created by Morgan Evans on 10/14/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import Foundation

enum Salary {
    case Hourly(Double), Yearly(Double)
}

class Job {
    var title : String
    var salary : Salary
    
    init(title: String, salary: Salary) {
        self.title = title
        self.salary = salary
    }
    
    func calculateIncome(hours: Double) -> Double {
        switch self.salary {
        case .Yearly(let pay):
            return pay
        case .Hourly(let pay):
            return hours * pay
        }
    }
    
    func raise(var percentage: Double) -> Void {
        percentage /= 100
        switch self.salary {
        case .Yearly(let pay):
            self.salary = Salary.Yearly(pay * percentage)
        case .Hourly(let pay):
            self.salary = Salary.Hourly(pay * percentage)
        }
    }
}

