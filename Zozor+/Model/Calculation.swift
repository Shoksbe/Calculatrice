//
//  File.swift
//  CountOnMe
//
//  Created by De knyf Gregory on 27/05/18.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculation {
    
    var previousResult : String = ""

    private var stringNumbers: [String] = [String()]
    private var operators: [String] = ["+"]
    private var index = 0

    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty || stringNumbers.count <= 1 {
                return false
            }
        }
        return true
    }

    var isStarted: Bool {
        if let stringNumber = stringNumbers.first {
            if !stringNumber.isEmpty || !previousResult.isEmpty {
                return true
            }
        }
        return false
    }

    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if !previousResult.isEmpty {
                        stringNumbers[stringNumbers.count-1] = previousResult
                        previousResult = ""
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

    func toText()-> String {
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

    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
    }
}
