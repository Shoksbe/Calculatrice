//
//  File.swift
//  CountOnMe
//
//  Created by De knyf Gregory on 27/05/18.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculation {

    
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var index = 0
    var previousResult : String?

    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        return true
    }

    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if let previousResult = previousResult {
                    stringNumbers[stringNumbers.count-1] = previousResult
                    return true
                }
                return false
            }
        }
        return true
    }

    
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    func addNewOperator(_ newOperator: String) {
        operators.append(newOperator)
        stringNumbers.append("")
    }

    func calculateTotal()-> Int {
        var total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }

        previousResult = String(total)
        
        return total
    }

    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
    }
}
