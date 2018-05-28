//
//  File.swift
//  CountOnMe
//
//  Created by De knyf Gregory on 27/05/18.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import Foundation

class Brain {

    
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var index = 0

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

        return total
    }

    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
    }

    func updateDisplay()-> String {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        return text
    }

}
