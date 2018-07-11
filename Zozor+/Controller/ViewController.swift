//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var calcul: Calculation!

    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Action
    
    //Adding the number tapped to the calculation
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calcul.addNewNumber(i)
                updateDisplay()
            }
        }
    }

    //Added operator "+" if it is possible, otherwise treatment of the error with an alert.
    @IBAction func plus() {
        if calcul.canAddOperator {
        	calcul.addNewOperator("+")
            updateDisplay()
        }else{
            if calcul.isStarted {
                showAlertWrongExpression()
            } else {
                showAlertBeginNewCalcul()
            }
        }
    }

    //Added operator "-" if it is possible, otherwise treatment of the error with an alert.
    @IBAction func minus() {
        if calcul.canAddOperator {
            calcul.addNewOperator("-")
            updateDisplay()
        }else{
            if calcul.isStarted {
                showAlertWrongExpression()
            } else {
                showAlertBeginNewCalcul()
            }
        }
    }

    //Calculates the total of the operation and processing the error with an alert.
    @IBAction func equal() {
        if calcul.isExpressionCorrect {
            let total = calcul.calculateTotal()
            textView.text = "\(total)"
            calcul.clear()
        }else{
            if calcul.isStarted {
                showAlertWrongExpression()
            } else {
                showAlertBeginNewCalcul()
            }
        }
    }
    
    //Resetting the calculation
    @IBAction func clear() {
        calcul.previousResult = ""
        calcul.clear()
        updateDisplay()
    }
    
    // MARK: - Methodes
    override func viewDidLoad() {
        calcul = Calculation()
    }
    
    ///Update the display with the new values
    private func updateDisplay() {
        textView.text = calcul.toText()
    }

    private func showAlertWrongExpression() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    private func showAlertBeginNewCalcul() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
