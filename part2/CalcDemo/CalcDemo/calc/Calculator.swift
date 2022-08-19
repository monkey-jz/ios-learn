//
//  Calculator.swift
//  CalcDemo
//
//  Created by boyaa on 2022/8/19.
//

import UIKit

class Calculator {
    //运算符集合
    let funcArray:CharacterSet = ["+","-","*","/","^","%"]
    func calc(equation: String) -> Double {
        let elementArray = equation.components(separatedBy: funcArray)
        var step = 0
        var result = Double(elementArray[0])!
        for ch in equation {
            switch ch {
            case "+":
                step += 1
                if elementArray.count > step {
                    result += Double(elementArray[step])!
                }
            case "-":
                step += 1
                if elementArray.count > step {
                    result -= Double(elementArray[step])!
                }
            case "*":
                step += 1
                if elementArray.count > step {
                    result *= Double(elementArray[step])!
                }
            case "/":
                step += 1
                if elementArray.count > step {
                    result /= Double(elementArray[step])!
                }
            case "%":
                step += 1
                if elementArray.count > step {
                    result = Double(Int(result) % Int(elementArray[step])!)
                }
            case "^":
                step += 1
                if elementArray.count > step {
                    let temp = result
                    for _ in 0..<Int(elementArray[step])! {
                        result *= temp
                    }
                    
                }
            default:
                break
            }
            
        }
       
        return result
        
    }

}
	
