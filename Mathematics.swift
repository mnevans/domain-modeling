//
//  Mathematics.swift
//  domain-modeling.swift
//
//  Created by Morgan Evans on 10/20/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import Foundation

protocol Mathematics {
    func add(secondAmount: Money) -> Money
    
    func subtract(secondAmount: Money) -> Money
}