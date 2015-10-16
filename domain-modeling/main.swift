//
//  main.swift
//  domain-modeling
//
//  Created by Morgan Evans on 10/14/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import Foundation

print("---- TESTING MONEY ----")
print("")

var amountUSD = Money(amount: 100, currency: "USD")
var amountGBP = Money(amount: 100, currency: "GBP")
print("Current amount of money: 100 USD and 100 GBP")
print("")

print("Amount of money after converting USD to GBP:")
print(amountUSD.convert("GBP").amount) // convert USD to GBP so $100 * .5 = $50

print("Amount of money after adding converted USD and GBP amounts:")
print(amountUSD.add(amountGBP).amount) // $100 USD (converts to $50 GBP) + $100 GBP = $150 because .5 GSP = 1 USD

print("Amount of money after subtracting converted USD and GBP amounts:")
print(amountUSD.subtract(amountGBP).amount) // $100 USD (converts to $50 GBP) - $100 GBP = -$50 because .5 GSP = 1 USD

print("")
print("---- TESTING JOB ----")
print("")

var teacher = Job(title: "Teacher", salary: .Hourly(25.00))
var programmer = Job(title: "Programmer", salary: .Yearly(110000.00))

print("Teacher's salary:")
print(teacher.salary)
print("")
print("After working 100 hours, a teacher will make:")
print(teacher.calculateIncome(100))
print("")
print("After receiving an 8% raise and working 100 hours, a teacher will make this much more:")
teacher.raise(8)
print(teacher.calculateIncome(100))
print("")
print("Programmer's salary:")
print(programmer.salary)
print("")
print("If he works 10 hours, a programmer's salary will still be:")
print(programmer.calculateIncome(10))

print("")
print("---- TESTING PERSON ----")
print("")

var Jack = Person(firstName: "Jack", lastName: "Beanstalk", age: 27, spouse: nil, job: programmer)
print(Jack.toString())
print("")

var Jill = Person(firstName: "Jill", lastName: "Beanstalk", age: 25, spouse: Jack, job: teacher)
print(Jill.toString())
print("")

var poor = Person(firstName: "Poor", lastName: "Person", age: 5, spouse: nil, job: nil)
print(poor.toString())

print("")
print("---- TESTING FAMILY ----")
print("")

var family = Family(members: [Jack, Jill]) // girl has 65/hour, boy has 100.00/year

print("Jack and Jill's yearly household income is:")
print(family.householdIncome(2000)) // 25 * 2000 + 110000 = 114000
print("")
print("The amount of people in their household is:")
print(family.members.count) // Jack + Jill = 2
print("")
print("After Jack and Jill have a child, the amount of people in their household is:")
family.haveChild()
print(family.members.count) // Jack + Jill + haveChild = 3
print("")

var poorPerson = Family(members: [poor])
print("Poor Person's yearly household income is:")
print(poorPerson.householdIncome(2000)) // no income because they are unemployed
print("")
print("The amount of people in their household is:")
print(poorPerson.members.count) // Poor Person = 1
print("")
print("Poor Person is too young to have a child, so the amount of people in their household is still:")
family.haveChild()
print(poorPerson.members.count) // cannot produce a new child because under the age of 21
print("")