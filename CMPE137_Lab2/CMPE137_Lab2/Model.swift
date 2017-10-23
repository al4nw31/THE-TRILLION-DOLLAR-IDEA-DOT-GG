//
//  Model.swift
//  CMPE137_Lab2
//
//  Created by Jared_Cook on 9/13/17.
//  Copyright © 2017 Jared_Cook. All rights reserved.
//

import Foundation
func changeSign(operand: Double) -> Double{
    return -operand;
}
func secondPower(operand: Double) -> Double{
    return pow(operand,2);
}
func thirdPower(operand: Double) -> Double{
    return pow(operand,3);
}

struct DataModel{
    //Class variables
    private var total: Double? = 0
    private var memoryTotal: Double? = 0
    private var firstNumber: Double?
    private var secondNumber: Double?
    private var operation: String?
    public var result: Double? {
        get{
            return self.total;
        }
    }

    private var variableValues: Dictionary<String, Double> = [:];   //Holds Value and corresponding value
    public var variableNames = Array<String>();                     //For drop down box    }
    private var drop2ndVals: (value:String, position:Int)?          //Drop down value to be put into second.

    
    private enum Operation{
        case constant(Double)
        case unaryOperation((Double)->Double)
        //case methods((inout DataModel) -> (Double, String) -> ())
        //case equalOperation((inout DataModel) -> (Double) -> Double)
    }
    
    private var operations: Dictionary<String, Operation>=[
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "log10" : Operation.unaryOperation(log10),
        "ln" : Operation.unaryOperation(log),
        "sin" : Operation.unaryOperation(sin),
        "cos" : Operation.unaryOperation(cos),
        "tan" : Operation.unaryOperation(tan),
        "asin" : Operation.unaryOperation(asin),
        "acos" : Operation.unaryOperation(acos),
        "atan" : Operation.unaryOperation(atan),
        "x^2" : Operation.unaryOperation(secondPower),
        "x^3" : Operation.unaryOperation(thirdPower),
        "±" : Operation.unaryOperation(changeSign),
    ]
    
    
    mutating func preformOperation(_ symbol: String){
        if let operation = operations[symbol]{
            print( " -> " + symbol, terminator:"");
            switch operation{
            case .constant(let value):
                print(value)
                self.total = value;
            case .unaryOperation(let function):
                if self.total != nil{
                    total = function(total!)
                    print(" = " + String(total!));
                }
            }
        }
    }
    
    //Setter for variableValues and variableNames
    mutating func setOperand(variableName: String){
        self.variableValues[variableName] = 0;
        self.variableNames.append(variableName);
    }
    
    mutating func setVariableValuesValue(key: String, value: Double){
        self.variableValues[key] = value;
    }
    
    func getVariableNamesValue(position: Int) -> String?{//variableNames getter for value at position
        return self.variableNames[position];                  //Intended for use with loop
    }
    
    func getVariableValuesValue(key: String) -> Double?{//variablesValue getter for value at position
        return self.variableValues[key];                     //Intended for use with loop
    }
    
    mutating func rmOperand(_ operand: String){//removes the
        self.variableNames = variableNames.filter{$0 != operand };
        self.variableValues.removeValue(forKey: operand);
    }
    
    mutating func setOperand(_ operand: Double){
        self.total = operand;
    }
    
    //(getter, setter) functions
    
    mutating func setDrop2ndVals(myDrop2ndVals:(String,Int)){
        self.drop2ndVals = myDrop2ndVals; 
    }
    
    func getDrop2ndVal_String() -> String?{
        return (self.drop2ndVals?.value);
    }
    
    func getMemoryTotal() -> Double{
        return self.memoryTotal!;
    }
    mutating func setMemoryTotal(number: Double)
    {
        self.memoryTotal = number;
    }
    func getFirstNumber() -> Double{
        return self.firstNumber!;
    }
    mutating func setFirstNumber(number: Double){
        self.firstNumber = number;
    }
    mutating func setFirstNumberNil(){
        self.firstNumber = nil;
    }
    func getSecondNumber() -> Double{
        return self.secondNumber!;
    }
    mutating func setSecondNumber(number: Double){
        self.secondNumber = number;
    }
    mutating func setSecondNumberNil(){
        self.secondNumber = nil; 
    }
    func getOperation() -> String?{
        return self.operation;
    }
    mutating func setOperation(operand: String){
        self.operation = operand;
    }
    mutating func setOperationNil(){
        self.operation = nil; 
    }
    func getTotal() -> Double?{
        return self.total!;
    }
    mutating func setTotal(number: Double){
        self.total = number;
    }
    mutating func clear(){
        self.total = 0;
    }
}

