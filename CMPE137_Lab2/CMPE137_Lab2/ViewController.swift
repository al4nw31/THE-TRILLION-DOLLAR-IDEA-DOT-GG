//
//  ViewController.swift
//  CMPE137_Lab2
//
//  Created by Jared_Cook on 8/30/17.
//  Copyright © 2017 Jared_Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, isAbleToReceiveData {
   
    func pass(data: DataModel?) {
        self.dataModel = data!;
    }
    
    //MARK: Properties
    //Controller
    weak var delegate: isAbleToReceiveData?

    private var dataModel = DataModel();
    private var buttons = [UIButton]();  //Holds all buttons 0-30
    var currentlyTyping :Bool = false;
    var secondButtonPushed :Bool = false;
    var clearButtonPushed :Bool = false;
    var tagOfLastButtonPushed = Array<Int>();
    var textBeforeLastButtonPushed :String?;
    //var varValueBeforeLastButtonPushed : Double?;
    
    //View
    var numberView: UILabel! = UILabel();
    var currentW: CGFloat = 0.0;        //x-Coordinate
    var currentH: CGFloat = 0.0;        //y-Coordinate

    var WBlocks: CGFloat = 4;           //Number of Blocks wide
    var HBlocks: CGFloat = 9;           //Number of Blocks tall
    
    func setCoordinates(myX: CGFloat, myY: CGFloat){
        self.currentW = myX;
        self.currentH = myY;
    }
    /*
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if (identifier == "<segue name>") {
            // pass the data
        }
    }
     */

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        
        //Collects Screen size before creating buttons
        let screenSize = UIScreen.main.bounds;
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        //print(screenHeight);

        var BlockW: CGFloat = screenWidth/WBlocks;          //Block Width
        var BlockH: CGFloat = (screenHeight-20)/HBlocks;    //Block Height

        func buttonSettings(myButton:UIButton, myTitle:String, myBackgroundColor:UIColor, myTitleColor:UIColor, myTag:Int){
            //button.layer.cornerRadius = 5
            myButton.layer.borderWidth = 1;
            myButton.layer.borderColor = UIColor.black.cgColor;
            myButton.setTitleColor(myTitleColor, for: .normal);
            myButton.setTitle(String(myTitle), for: .normal);
            myButton.backgroundColor = myBackgroundColor;
            myButton.addTarget(self.view.inputViewController, action: #selector(buttonAction), for: .touchUpInside);
            myButton.addTarget(self, action: #selector(normalButtonPush), for: UIControlEvents.touchDown);
            myButton.tag=myTag;
            self.buttons.append(myButton);
            self.view.addSubview(myButton);
            //end
        }
    
        //sets init coordinates
        self.setCoordinates(myX: screenWidth-(screenWidth/(WBlocks/2)), myY: screenHeight-(screenHeight-20)/HBlocks);
        var count = 0;
        for i in -1...9{//Sets up buttons (., 1,2,3,4,5,6,7,8,9)
            if(i == -1){//Sets up the '.' button on the calculator... (.)
                let button = UIButton(frame: CGRect(x: currentW, y: currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: ".",myBackgroundColor: UIColor(displayP3Red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0),myTitleColor: UIColor.black,myTag:i);
            }
            else if(i == 0){//Sets up the '0' button on the calculator which is twice the size of the other buttons... (0)
                self.currentW = 0;
                let button = UIButton(frame: CGRect(x: currentW, y: currentH, width: (BlockW*2), height: BlockH));
                buttonSettings(myButton: button,myTitle: String(i),myBackgroundColor: UIColor(displayP3Red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0),myTitleColor: UIColor.black,myTag:i);
            }
            else if(count == 0){//Sets up the first button on the far left for each row... (1,4,7)
                self.currentW = 0;
                self.currentH -= BlockH;
                let button = UIButton(frame: CGRect(x: 0, y: currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: String(i),myBackgroundColor: UIColor(displayP3Red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0),myTitleColor: UIColor.black,myTag:i);
                count += 1;
            }
            else if(count == 1){//Sents up one button to the left... (2,5,8)
                //currentW = screenWidth - screenWidth/(WBlocks * 0.75)
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: currentW, y: currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: String(i),myBackgroundColor: UIColor(displayP3Red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0),myTitleColor: UIColor.black,myTag:i);
                count += 1;
            }
            else if(count == 2){//Sets up one button to the left... (3,6,9)
                //currentW = screenWidth - screenWidth/(WBlocks * 0.50)
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: currentW, y: currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: String(i),myBackgroundColor: UIColor(displayP3Red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0),myTitleColor: UIColor.black,myTag:i);
                count = 0;
            }
        }

        //Sets up buttons
        // 10 = '='
        // 11 = '+'
        // 12 = '-'
        // 13 = '*'
        //Setup =,+,-,* going up.
        
        //Setting Coordinates
        self.setCoordinates(myX: screenWidth/WBlocks * 3, myY: screenHeight-(screenHeight-20)/HBlocks)
        for i in  10...13{
            if(i == 10){
                let button = UIButton(frame: CGRect(x: currentW, y: currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "=",myBackgroundColor: UIColor.orange,myTitleColor: UIColor.white,myTag:i);
            }
            if(i == 11){
                self.currentH -= BlockH;
                let button = UIButton(frame: CGRect(x: currentW, y: currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "+",myBackgroundColor: UIColor.orange,myTitleColor: UIColor.white,myTag:i);
            }
            if(i == 12){
                self.currentH -= BlockH;
                let button = UIButton(frame: CGRect(x: currentW, y: currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "-",myBackgroundColor: UIColor.orange,myTitleColor: UIColor.white,myTag:i);
            }
            if(i == 13){
                self.currentH -= BlockH;
                let button = UIButton(frame: CGRect(x: currentW, y: currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "x",myBackgroundColor: UIColor.orange,myTitleColor: UIColor.white,myTag:i);
            }
        }
        
        // 14 = 'A/C'
        // 15 = '±'
        // 16 = 'e' || pi
        // 17 = '÷'
        //Setup /,Euler’s natural number (e),pi, +/-, and A/C.
        
        self.setCoordinates(myX: 0, myY: screenHeight-(screenHeight-20)/HBlocks*5)
        for i in 14...17{
            if(i == 14){
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "A/C",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
            }
            if(i == 15){
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "±",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
            }
            if(i == 16){
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "e",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
                //e || pi
            }
            if(i == 17){
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "÷",myBackgroundColor: UIColor.orange,myTitleColor: UIColor.white,myTag:i);
            }
        }
        
        // 18 = 2nd
        // 19 = sin | sin^-1
        // 20 = cos | cos^-1
        // 21 = tan | tan^-1
        self.setCoordinates(myX: 0, myY: screenHeight-(screenHeight-20)/HBlocks*6)
        for i in 18...21{
            if(i == 18){
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "2nd",myBackgroundColor: UIColor(displayP3Red: 0.2, green: 0.5, blue: 1.0, alpha: 1.0),myTitleColor: UIColor.black,myTag:i);
            }
            if(i == 19){
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "sin",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
                //x^2 || x^(1/2)
            }
            if(i == 20){
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "cos",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
            }
            if(i == 21){
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "tan",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
            }
        }
        
        // 22 = log10
        // 23 = X  |
        // 24 = x^2  | x^3
        // 25 = sqrt |
        self.setCoordinates(myX: 0, myY: screenHeight-(screenHeight-20)/HBlocks*7)
        for i in 22...25{
            if(i == 22){
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "√",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
            }
            if(i == 23){
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "X",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
            }
            if(i == 24){
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "x^2",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
            }
            if(i == 25){
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "log10",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
            }
        }
        
        //Memory
        // 26 = MC
        // 27 = MR
        // 28 = MS
        // 29 = M+
        self.setCoordinates(myX: 0, myY: screenHeight-(screenHeight-20)/HBlocks*8)
        for i in 26...29{
            if(i == 26){
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "MC",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
            }
            if(i == 27){
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "MR",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
            }
            if(i == 28){
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "MS",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
            }
            if(i == 29){
                self.currentW += BlockW;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: BlockW, height: BlockH));
                buttonSettings(myButton: button,myTitle: "M+",myBackgroundColor: UIColor.lightGray,myTitleColor: UIColor.black,myTag:i);
            }
        }

        self.setCoordinates(myX: 0, myY: 20);
        self.numberView = UILabel(frame:CGRect(x: self.currentW ,y: currentH,width:BlockW*WBlocks,height:BlockH));
        self.numberView.textAlignment = NSTextAlignment.right;
        self.numberView.text = String(describing: self.dataModel.getTotal()!);
        self.view.addSubview(self.numberView);

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    /*
    override func viewDidAppear(_ animated: Bool){
        //let controller = varView();
        //controller.view.backgroundColor = UIColor .green
        //present(controller, animated: true, completion: nil)
    }
     */
    
    
    //Button Functions
    // 10 = '='     // 14 = 'A/C'       // 18 = 2nd             // 22 = sqrt | var+       // 26 = MC
    // 11 = '+'     // 15 = '+/-'       // 19 = sin | sin^-1    // 23 = X         // 27 = MR
    // 12 = '-'     // 16 = 'e' || pi   // 20 = cos | cos^-1    // 24 = x^2  | x^3     // 28 = MS
    // 13 = '*'     // 17 = '÷'         // 21 = tan | tan^-1    // 25 = log10 | ln     // 29 = M+
    
    //MARK: Actions
    @objc func normalButtonPush(_ sender: UIButton) {//Will eventually be different for {div, mul, sub, add}
        sender.showsTouchWhenHighlighted = true;
    }
    
    @objc func buttonAction(sender: UIButton!){
        let tag: Int = sender.tag;
        //print(String(sender.tag) + " -> " + self.buttons[sender.tag+1].currentTitle!);
        if((sender.tag != 14 && sender.tag != 18 && sender.tag != 26 && sender.tag != 27 && sender.tag != 28 && sender.tag != 29) && true != ((sender.tag == 23 && self.buttons[sender.tag+1].currentTitle! == "X") || (sender.tag == 22 && self.buttons[sender.tag+1].currentTitle! == "var+") || (sender.tag == 15 && self.buttons[sender.tag+1].currentTitle! == "graph"))){
            //print("test");
            self.tagOfLastButtonPushed.append(sender.tag);
            self.textBeforeLastButtonPushed = String(describing: self.numberView.text!);
            //self.varValueBeforeLastButtonPushed = self.dataModel.getVariableValuesValue(key: self.buttons[24].currentTitle!);
            //print(tagOfLastButtonPushed.count);
        }
        /* for undoing the storing of variable values
        if(sender.tag == 22 && self.buttons[sender.tag+1].currentTitle! == "var+"){
            self.varValueBeforeLastButtonPushed = self.dataModel.getVariableValuesValue(key:
                self.buttons[24].currentTitle!);
            print("collect varValuebeforeLastButtonPushdescribing:  = " + String(describing: self.dataModel.getVariableValuesValue(key: self.buttons[24].currentTitle!)!))
        }
         */
        
        
        var displayValue: Double {
            get {
                return Double(self.numberView.text!)!;
            }
            set {
                self.numberView.text = String(newValue);
            }
        }
        if(tag >= -1 && tag <= 9){
            //button 0 - 9 action
            let digit = sender.currentTitle!;
            if currentlyTyping{
                let textCurrentlyInDisplay = self.numberView.text;
                if((digit == "." && self.numberView.text?.contains(".") != true) || digit != "."){
                    print(digit, terminator:"");
                    self.numberView.text = textCurrentlyInDisplay! + digit;
                }
            }
            else{
                print(digit, terminator:"");
                self.numberView.text = digit;
                self.currentlyTyping = true;
            }
        }
        else{
            if(tag == 10){// =
                self.currentlyTyping = false;
                self.clearButtonPushed = false;
                var result = 0.0;
                self.dataModel.setSecondNumber(number: displayValue);
                
                if(self.dataModel.getOperation() != nil)
                {
                    if(self.dataModel.getOperation()! == "+")
                    {
                        result = self.dataModel.getFirstNumber() + self.dataModel.getSecondNumber();
                    }
                    if(self.dataModel.getOperation()! == "-")
                    {
                        result = self.dataModel.getFirstNumber() - self.dataModel.getSecondNumber();
                    }
                    if(self.dataModel.getOperation()! == "x")
                    {
                        result = self.dataModel.getFirstNumber() * self.dataModel.getSecondNumber();
                    }
                    if(self.dataModel.getOperation()! == "÷")
                    {
                        result = self.dataModel.getFirstNumber() / self.dataModel.getSecondNumber();
                    }
                    self.dataModel.setTotal(number: result);
                    print(" = " + String(self.dataModel.result!));
                    self.numberView.text = String(self.dataModel.result!);
                }
                else{
                    print(" -> (Nothing to do for '='!)");
                }
                
                
            } //+ , - , *, /
            if(tag >= 11 && tag <= 13 || tag == 17 ){
                self.currentlyTyping = false;
                self.dataModel.setFirstNumber(number:displayValue);
                self.dataModel.setOperation(operand: sender.currentTitle!);
                print(" " + sender.currentTitle! + " ", terminator:"");

            }
            if(tag == 18)
            {//secondButton
                if(self.secondButtonPushed)
                {
                    self.secondButtonPushed = false;
                    self.buttons[15].setTitle("A/C", for: .normal);
                    self.buttons[16].setTitle("±", for: .normal);
                    self.buttons[17].setTitle("e", for: .normal);
                    self.buttons[20].setTitle("sin", for: .normal);
                    self.buttons[21].setTitle("cos", for: .normal);
                    self.buttons[22].setTitle("tan", for: .normal);
                    self.buttons[23].setTitle("√", for: .normal);
                    self.buttons[24].setTitle("X", for: .normal);
                    self.buttons[25].setTitle("x^2", for: .normal);
                    self.buttons[26].setTitle("log10", for: .normal);
                }
                else{
                    self.secondButtonPushed = true;
                    self.buttons[15].setTitle("undo", for: .normal);
                    self.buttons[16].setTitle("graph", for: .normal);
                    self.buttons[17].setTitle("π", for: .normal);
                    self.buttons[20].setTitle("asin", for: .normal);
                    self.buttons[21].setTitle("acos", for: .normal);
                    self.buttons[22].setTitle("atan", for: .normal);
                    if(self.dataModel.getDrop2ndVal_String() != nil){
                        self.buttons[23].setTitle("var+", for: .normal);
                        self.buttons[24].setTitle(self.dataModel.getDrop2ndVal_String()!, for: .normal);
                    }
                    self.buttons[25].setTitle("x^3", for: .normal);
                    self.buttons[26].setTitle("ln", for: .normal);
                }
            }
            if(tag >= 15 && tag <= 16 || tag >= 19 && tag <= 22 || tag >= 24 && tag <= 25){//other
                if(tag == 15 && self.buttons[tag+1].currentTitle == "graph"){
                    let controller = graphView(sWidth: UIScreen.main.bounds.width, sHeight: UIScreen.main.bounds.height, data: dataModel);
                    //controller.delegate = self;
                    controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
                    present(controller, animated: true, completion: nil);
                }
                else{
                    if(currentlyTyping){
                        self.dataModel.setOperand(displayValue);
                        self.currentlyTyping = false;
                    }
                    if let mathematicalSymbol = sender.currentTitle{
                        //print(mathematicalSymbol)
                        self.dataModel.preformOperation(mathematicalSymbol);
                    }
                    if let result = dataModel.result{
                        //print(result)
                        displayValue = result;
                    }
                    if(self.buttons[23].currentTitle == "var+"){
                        self.dataModel.setVariableValuesValue(key: self.buttons[24].currentTitle!,  value: displayValue);
                        print("\n" + "var+ -> " + self.buttons[24].currentTitle! + " -> " + String(displayValue));
                    }
                }
            }
            if(tag == 14){//clear button - 2nd -> undo button
                if(self.buttons[15].currentTitle == "A/C")
                {
                    if(clearButtonPushed)
                    {
                        print("Clear Stack");
                        self.dataModel.clear();
                        self.numberView.text = String(describing: dataModel.getTotal()!);
                        self.currentlyTyping = false;
                        self.clearButtonPushed = false;
                        //clear undo
                        self.tagOfLastButtonPushed.removeAll();
                        self.textBeforeLastButtonPushed = nil;
                    }
                    else{//false
                        //dataModel.clear();
                        print(" -> Clear Screen -> ", terminator:"");
                        self.numberView.text = String(0.0);
                        self.currentlyTyping = false;
                        self.clearButtonPushed = true;
                        //clear undo
                        //self.tagOfLastButtonPushed.removeAll();
                        //self.textBeforeLastButtonPushed = nil;
                    }
                }
                else if(self.buttons[15].currentTitle == "undo")  //undo settings
                {
                    if(self.tagOfLastButtonPushed.last == nil){
                        self.numberView.text = String(0.0);
                        self.currentlyTyping = false;
                        //print("undo -> " + self.buttons[self.tagOfLastButtonPushed.last!+1].currentTitle! + " = " + self.numberView.text!);
                        print("nil");
                    }
                    else if(self.tagOfLastButtonPushed.count == 1){
                        self.numberView.text = String(0.0);
                        self.currentlyTyping = false;
                        print("undo -> " + self.buttons[self.tagOfLastButtonPushed.last!+1].currentTitle! + " = " + self.numberView.text!);
                        self.tagOfLastButtonPushed.removeLast();
                        //print("before space");
                    }
                    else{//The ations for undo of last button tag pushed.
                        if(self.tagOfLastButtonPushed.last! >= -1 && self.tagOfLastButtonPushed.last! <= 9){
                            self.numberView.text?.removeLast();
                            print("undo -> " + self.buttons[self.tagOfLastButtonPushed.last!+1].currentTitle! + " = " + self.numberView.text!);
                            self.tagOfLastButtonPushed.removeLast();//Needs to be at the end of each option
                        }
                        else if(self.tagOfLastButtonPushed.last! >= 11 && self.tagOfLastButtonPushed.last! <= 13 || self.tagOfLastButtonPushed.last! == 17){
                            self.currentlyTyping = true;
                            self.dataModel.setFirstNumberNil();
                            self.dataModel.setOperationNil();
                            self.numberView.text = self.textBeforeLastButtonPushed;
                            print("undo -> " + self.buttons[self.tagOfLastButtonPushed.last!+1].currentTitle! + " = " + self.numberView.text!);
                            self.tagOfLastButtonPushed.removeLast();
                        }
                        else if(self.tagOfLastButtonPushed.last! == 10){
                            self.currentlyTyping = true;
                            self.dataModel.setSecondNumberNil();
                            self.numberView.text = self.textBeforeLastButtonPushed;
                            //self.dataModel.setTotal(number: 0);
                            print("undo -> " + self.buttons[self.tagOfLastButtonPushed.last!+1].currentTitle! + " secondVar -> " + self.numberView.text!);
                            self.tagOfLastButtonPushed.removeLast();
                        }
                            /* for undoing the storing of variable values
                        else if(self.tagOfLastButtonPushed.last! == 22 && self.buttons[self.tagOfLastButtonPushed.last!+1].currentTitle! == "var+"){
                            print("testing - > " + self.buttons[24].currentTitle! + String(self.varValueBeforeLastButtonPushed!));
                            self.dataModel.setVariableValuesValue(key: self.buttons[24].currentTitle!, value: self.varValueBeforeLastButtonPushed!);
                            
                            self.numberView.text = String(self.varValueBeforeLastButtonPushed!);
                            
                            self.tagOfLastButtonPushed.removeLast();
                        }*/
                        else if((self.tagOfLastButtonPushed.last! >= 19 && self.tagOfLastButtonPushed.last! <= 25) || (self.tagOfLastButtonPushed.last! >= 15 && self.tagOfLastButtonPushed.last! <= 16)){
                            self.numberView.text = self.textBeforeLastButtonPushed;
                            print("undo -> " + self.buttons[self.tagOfLastButtonPushed.last!+1].currentTitle! + " = " + self.numberView.text!);
                            self.tagOfLastButtonPushed.removeLast();
                            
                        }
                    }
                }
            }
            if(tag == 23){
                if(self.buttons[24].currentTitle == "X")
                {
                    let controller = varView(sWidth: UIScreen.main.bounds.width, sHeight: UIScreen.main.bounds.height, data: dataModel);
                    controller.delegate = self;
                    controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
                    present(controller, animated: true, completion: nil);
                }
                else{
                    displayValue = self.dataModel.getVariableValuesValue(key: self.buttons[24].currentTitle!)!;
                    self.currentlyTyping = false;
                    print(self.buttons[24].currentTitle!, terminator:" ");
                }
            }
            if(tag >= 26 && tag <= 29)//memory ctrls
            {
                var result = 0.0;
                
                if(tag == 26){
                    self.dataModel.setMemoryTotal(number: 0);
                    print(" -> MC = 0");
                }
                if(tag == 27){
                    self.numberView.text = String(self.dataModel.getMemoryTotal());
                    self.currentlyTyping = false;
                    print(" -> MR = " + String(self.dataModel.getMemoryTotal()));
                }
                if(tag == 28){
                    result = displayValue;
                    self.dataModel.setMemoryTotal(number: result);
                    print(" -> MS = " + String(result));
                }
                if(tag == 29){
                    result = displayValue + self.dataModel.getMemoryTotal();
                    self.dataModel.setMemoryTotal(number: result);
                    print(" -> M+ = " + String(result));
                }
            }
        }
    }
}


