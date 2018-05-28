//
//  BrainTestCase.swift
//  CountOnMeTests
//
//  Created by Gregory De knyf on 28/05/18.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculationTestCase: XCTestCase {
    
    var calcul: Calculation!
    
    override func setUp() {
        super.setUp()
        calcul = Calculation()
    }
    
    func testGivenEmptyNumbersTable_WhenAddingOneNumber_ThenTableNumberCountIs1() {
        calcul.addNewNumber(5)
        
        XCTAssertEqual(calcul.stringNumbers.count, 1)
    }
    
    func testGivenNumber6_WhenAskIfCanAddOperator_ThenResponseIsTrue() {
        calcul.addNewNumber(6)
        
        XCTAssertTrue(calcul.canAddOperator)
    }
    
    func testGivenNumberFinisByOperator_WhenAskIfCanAddOperator_ThenResponseIsFalse() {
        calcul.addNewNumber(6)
        calcul.addNewOperator("+")
        
        XCTAssertFalse(calcul.canAddOperator)
    }
    
    func testGivenNumber5_WhenAddingOperator_ThenNumberTableCountIs2AndOperatorTableCountIs1() {
        calcul.addNewNumber(5)
        
        calcul.addNewOperator("+")
        
        XCTAssertEqual(calcul.stringNumbers.count, 2)
        XCTAssertEqual(calcul.operators.count, 2)
    }
    
    func testGivenAdds5To6_WhenTotalIsCalculate_ThenTotalEquals11() {
        calcul.addNewNumber(5)
        calcul.addNewOperator("+")
        calcul.addNewNumber(6)
        
        let total = calcul.calculateTotal()
        
        XCTAssertEqual(total, 11)

    }
    
    func testGivenSubstract8To10_WhenTotalIsCalculate_ThenTotalEquals2() {
        calcul.addNewNumber(10)
        calcul.addNewOperator("-")
        calcul.addNewNumber(8)
        
        let total = calcul.calculateTotal()
        
        XCTAssertEqual(total, 2)
    }
    
    func testGivenNumber5AndOperatorPlus_WhenCheckIfExpressionIsCorrect_ThenExpressionCorrectEqualsFalse() {
        calcul.addNewNumber(5)
        calcul.addNewOperator("+")
        
        XCTAssertFalse(calcul.isExpressionCorrect)
    }
    
    func testGivenAdds5To5_WhenCheckIfExpressionIsCorrect_ThenExpressionCorrectEqualsTrue() {
        calcul.addNewNumber(5)
        calcul.addNewOperator("+")
        calcul.addNewNumber(5)
        
        XCTAssertTrue(calcul.isExpressionCorrect)
    }
    
    func testGivenStringNumber5Plus5_WhenClearIsCalled_ThenNumberTableAndOperatorTableCountEquals1() {
        calcul.addNewNumber(5)
        calcul.addNewOperator("+")
        calcul.addNewNumber(5)
        
        calcul.clear()
        
        XCTAssertEqual(calcul.stringNumbers.count, 1)
        XCTAssertEqual(calcul.operators.count, 1)
    }
}

