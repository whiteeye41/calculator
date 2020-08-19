//
//  ViewController.swift
//  Calculator
//
//  Created by cosima on 2020/8/19.
//  Copyright © 2020 cosima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lable: UILabel!
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var opertion:OperatorType = .none
    var startNew = true
    
    
    //數字按鍵
    @IBAction func number(_ sender: UIButton) {
        let numbers = sender.tag - 1
        
        if lable.text != nil {
            if startNew == true{
                lable.text = "\(numbers)"
                startNew = false
            }else{
                if lable.text == "0" || lable.text == "+" || lable.text == "-" || lable.text == "x" || lable.text == "/"{
                    lable.text = "\(numbers)"
                }else{
                    lable.text = lable.text! + "\(numbers)"
                }
            }
            numberOnScreen = Double(lable.text!) ?? 0
        }
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        lable.text = "0"
        numberOnScreen = 0
        previousNumber = 0
        performingMath = false
        opertion = .none
        startNew = true
    }
    
    @IBAction func division(_ sender: UIButton) {
        lable.text = "/"
        opertion = .division
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func multiplication(_ sender: UIButton) {
        lable.text = "x"
        opertion = .multiplication
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func subtraction(_ sender: UIButton) {
        lable.text = "-"
        opertion = .subtraction
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func add(_ sender: UIButton) {
        lable.text = "+"
        opertion = .add
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func anser(_ sender: UIButton) {
        if performingMath == true {
            switch opertion {
                case .add:
                    numberOnScreen = previousNumber + numberOnScreen
                    makeOKNumberString(from:numberOnScreen)
                case .subtraction:
                    numberOnScreen = previousNumber - numberOnScreen
                    makeOKNumberString(from:numberOnScreen)
                case .division:
                    numberOnScreen = previousNumber / numberOnScreen
                    makeOKNumberString(from:numberOnScreen)
                case .multiplication:
                    numberOnScreen = previousNumber * numberOnScreen
                    makeOKNumberString(from:numberOnScreen)
                case .none:
                    lable.text = "0"
            }
                performingMath = false
                startNew = true
        }
    }
    
    func makeOKNumberString (from number:Double){
        var oktext:String
        if floor(number) == number{
            oktext = "\(Int(number))"
        }else{
            oktext = "\(number)"
        }
        if oktext.count >= 10{
            oktext = String(oktext.prefix(7))
        }
        lable.text = oktext
    }
    
    
    //狀態列反白
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

enum OperatorType {
    case division
    case multiplication
    case subtraction
    case add
    case none
}
