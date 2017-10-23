//
//  addVarView.swift
//  CMPE137_Lab2
//
//  Created by Jared_Cook on 10/2/17.
//  Copyright © 2017 Jared_Cook. All rights reserved.
//

import UIKit
import Foundation
import UIDropDown

protocol isAbleToReceiveData: class {
    func pass(data: DataModel?)
}

class varView: UIViewController{
    
    var delegate: isAbleToReceiveData?
    
    //vars for UI
    private var dataModel: DataModel!
    private var textField_1: UITextField!
    private var buttons = [UIButton]();
    private var myDownPicker: UITextField!
    var drop: UIDropDown!
    private var dropCurrentVals: (value:String, position:Int)?
    
    //vars for screen positioning
    private var popupWidth: CGFloat! = UIScreen.main.bounds.width;
    private var popupHeight: CGFloat! = UIScreen.main.bounds.height;

    private var currentW: CGFloat = 0.0;        //x-Coordinate
    private var currentH: CGFloat = 0.0;        //y-Coordinate
    
    private var WBlocks: CGFloat = 4;           //Number of Blocks wide
    private var HBlocks: CGFloat = 9;           //Number of Blocks tall
    
    private var BlockW: CGFloat!          //Block Width
    private var BlockH: CGFloat!          //Block Height
    
    private var screenWidth: CGFloat!
    private var screenHeight: CGFloat!
    
    func setCoordinates(myX: CGFloat, myY: CGFloat){
        self.currentW = myX;
        self.currentH = myY;
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //textField_1.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.pass(data: self.dataModel) //call the func in the previous vc
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        if(self.textField_1.isEditing == false){
            //print("test");
            self.textField_1.text = "";
        }
        else{
            self.view.endEditing(true);
        }
    }
    
    init(sWidth: CGFloat, sHeight: CGFloat, data: DataModel) {
        super.init(nibName: nil, bundle: nil);
        //set itit coordinates
        self.screenWidth = sWidth;
        self.screenHeight = sHeight;
        self.setCoordinates(myX: self.screenWidth-self.screenWidth, myY: (self.screenHeight-self.screenHeight)+20);
        self.BlockW = self.screenWidth/self.WBlocks;
        self.BlockH = (self.screenHeight-20)/self.HBlocks;
        self.dataModel = data;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sets the subview title
        self.title = "myVarView";

        func buttonSettings(myButton:UIButton, myTitle:String, myBackgroundColor:UIColor, myTitleColor:UIColor, myTag:Int){
            //button.layer.cornerRadius = 5
            myButton.layer.borderWidth = 1;
            myButton.layer.borderColor = UIColor.black.cgColor;
            myButton.setTitleColor(myTitleColor, for: .normal);
            myButton.setTitle(String(myTitle), for: .normal);
            myButton.backgroundColor = myBackgroundColor;
            myButton.addTarget(self.view.inputViewController, action: #selector(buttonAction), for: .touchUpInside);
            myButton.tag=myTag;
            self.buttons.append(myButton);
            self.view.addSubview(myButton);
            //end
        }

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5);
        //self.view.backgroundColor = UIColor.clear;
        //self.view.isOpaque = true;
        //self.view.superview?.bounds = CGRect(x:0, y:0, width:500, height:500);
        //self.view.superview?.backgroundColor = UIColor.clear;
        //Var Textbox Input
        
        self.textField_1 = UITextField(frame: CGRect(x: self.currentW, y: self.currentH, width: self.popupWidth, height: self.BlockH)); //x = 20, y = 100
        self.textField_1.text = "Create a New Var";
        self.textField_1.textAlignment = NSTextAlignment.center;
        self.textField_1.backgroundColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
        self.textField_1.borderStyle = UITextBorderStyle.roundedRect;
        self.textField_1.addTarget(self, action: #selector(textFieldDidBeginEditing), for: UIControlEvents.touchDown);
        //self.textField_1.addTarget(self, action: #selector(textFieldStopEditing), for: UIControlEvents.touchDown);
        
        for i in 0...7
        {
            if(i == 0){//2nd | DELETE buttons
                self.currentH += self.BlockH;
                self.drop = UIDropDown(frame: CGRect(x: self.currentW, y: self.currentH, width: self.popupWidth * 0.5, height: 30));
                self.drop.backgroundColor = UIColor.white;
                //drop.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
                self.drop.placeholder = "Variable Select"
                //self.drop.options = ["Mexico", "USA", "England", "France", "Germany", "Spain", "Italy", "Canada"]
                self.drop.didSelect{(option, index) in
                    //print("String: " + (option) + " number: " + String(index));
                    self.dropCurrentVals = (option, index);
                }
                self.drop.options = self.dataModel.variableNames;
            }
            if(i == 1){//CREATE
                self.currentW += self.popupWidth * 0.5;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: self.popupWidth * 0.5, height: self.BlockH));
                buttonSettings(myButton: button, myTitle: "Display Var", myBackgroundColor: UIColor(displayP3Red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0), myTitleColor: UIColor.black, myTag: i);
            }
            if(i == 2){//2nd
                self.currentW = 0;
                self.currentH += self.BlockH;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: self.popupWidth * 0.5, height: self.BlockH));
                buttonSettings(myButton: button, myTitle: "Delete", myBackgroundColor: UIColor(displayP3Red: 0.87, green: 0.0, blue: 0.0, alpha: 1.0), myTitleColor: UIColor.black, myTag: i);
            }
            if(i == 3){//Help
                self.currentW += self.popupWidth * 0.5;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: self.popupWidth * 0.5, height: self.BlockH));
                buttonSettings(myButton: button, myTitle: "Create", myBackgroundColor: UIColor(displayP3Red: 0.35, green: 0.7, blue: 0.4, alpha: 1.0), myTitleColor: UIColor.black, myTag: i);
            }
            if(i == 4){//Cancle
                self.currentW = 0;
                self.currentH += self.BlockH;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: self.popupWidth * 0.5, height: self.BlockH));
                buttonSettings(myButton: button, myTitle: "2nd", myBackgroundColor: UIColor(displayP3Red: 0.2, green: 0.5, blue: 1.0, alpha: 1.0), myTitleColor: UIColor.black, myTag: i);
            }
            if(i == 5){//OK
                self.currentW += self.popupWidth * 0.5;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: self.popupWidth * 0.5, height: self.BlockH));
                buttonSettings(myButton: button, myTitle: "Exit", myBackgroundColor: UIColor(displayP3Red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0), myTitleColor: UIColor.black, myTag: i);
            }
        }
        self.view.addSubview(self.textField_1!);
        self.view.addSubview(self.drop);
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }

    @objc func buttonAction(sender: UIButton!){
        let tag = sender.tag;
        sender.showsTouchWhenHighlighted = true;
        var displayValue: Double {
            get {
                return Double(textField_1!.text!)!;
            }
            set {
                textField_1!.text = String(newValue);
            }
        }
        if(tag == 1){//Display Var
            if((self.dropCurrentVals?.value) != nil){
                self.textField_1!.text = (self.dropCurrentVals?.value)! + " = " + String(describing: self.dataModel.getVariableValuesValue(key: (self.dropCurrentVals?.value)!)!);
            }
        }
        if(tag == 2){//Delete
            if((self.dropCurrentVals?.value) != nil){
                print("Delete -> " + (self.dropCurrentVals?.value)!);
                self.dataModel.rmOperand((self.dropCurrentVals?.value)!);
                self.drop.setTitle(myTitle: "Variable Select"); 
                self.drop.options = self.dataModel.variableNames;
            }
            else{
                print("No value to delete");
            }
        }
        if(tag == 3){//Create
            var tmp = false;
            if(self.textField_1.text == "Create a New Var" || self.textField_1.text == ""){
                print("Please enter a valid variable");
            }
            else{
                for variableName in self.dataModel.variableNames{
                    if((variableName) == (self.textField_1.text!)){
                        print("Please enter a valid variable");
                        tmp = true;
                        break;
                    }
                }
                if(tmp == false){
                    print("Create -> " + self.textField_1.text!);
                    self.dataModel.setOperand(variableName: (self.textField_1.text!));
                    //dropCurrentVals.position
                    self.drop.options = self.dataModel.variableNames;
                }
            }
        }
        if(tag == 4){//2nd
            if((self.dropCurrentVals?.value) != nil)
            {
                print("2nd -> " + (self.dropCurrentVals?.value)!);
                self.dataModel.setDrop2ndVals(myDrop2ndVals: self.dropCurrentVals!);
            }
        }
        if(tag == 5){
            dismiss(animated: true, completion: nil);
        }
    }
}

