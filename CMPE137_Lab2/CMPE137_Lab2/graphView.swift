//
//  graphView.swift
//  CMPE137_Lab2
//
//  Created by Jared_Cook on 10/22/17.
//  Copyright © 2017 Jared_Cook. All rights reserved.
//

import Foundation
import Charts

class graphView: UIViewController{
    
    //var delegate: isAbleToReceiveGraphData?
    
    //vars for UI
    private var dataModel: DataModel!
    private var buttons = [UIButton]();
    private var textField_1: UITextField!
    private var lineChartView: LineChartView!

    
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
        //delegate?.pass(data: self.dataModel) //call the func in the previous vc
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
        self.title = "myGraphView";
        
        func buttonSettings(myButton:UIButton, myTitle:String, myBackgroundColor:UIColor, myTitleColor:UIColor, myTag:Int){
            //button.layer.cornerRadius = 5
            //myButton.layer.borderWidth = 1;
            //myButton.layer.borderColor = UIColor.black.cgColor;
            myButton.setTitleColor(myTitleColor, for: .normal);
            myButton.setTitle(String(myTitle), for: .normal);
            myButton.backgroundColor = myBackgroundColor;
            myButton.addTarget(self.view.inputViewController, action: #selector(buttonAction), for: .touchUpInside);
            myButton.tag=myTag;
            self.buttons.append(myButton);
            self.view.addSubview(myButton);
            //end
        }
        
        //self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5);
        self.view.backgroundColor = UIColor.white;
        //self.view.backgroundColor = UIColor.clear;
        //self.view.isOpaque = true;
        //self.view.superview?.bounds = CGRect(x:0, y:0, width:500, height:500);
        //self.view.superview?.backgroundColor = UIColor.clear;
        //Var Textbox Input
        
        self.textField_1 = UITextField(frame: CGRect(x: self.currentW, y: self.currentH, width: self.popupWidth, height: self.BlockH)); //x = 20, y = 100
        self.textField_1.text = "M = " + String(dataModel.getMemoryTotal());
        self.textField_1.isUserInteractionEnabled = false;
        self.textField_1.textAlignment = NSTextAlignment.center;
        self.textField_1.backgroundColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
        self.textField_1.borderStyle = UITextBorderStyle.roundedRect;
        //self.textField_1.addTarget(self, action: #selector(textFieldDidBeginEditing), for: UIControlEvents.touchDown);
        //self.textField_1.addTarget(self, action: #selector(textFieldStopEditing), for: UIControlEvents.touchDown);
    
        self.currentW = 0;
        self.currentH += self.BlockH;
        
        //myBarCharView
        lineChartView = LineChartView(frame: CGRect(x: self.currentW, y: self.currentH, width: self.popupWidth, height: self.BlockH * CGFloat(7)));
        lineChartView.noDataText = "You need to provide data for the chart."
        
        //Beggining of Chart
        // Do any additional setup after loading the view.
        
        let xaxis = ["M"]
        //let unitsSold = [5.0, 5.0, 5.0]
        
        func setChart(dataPoints: [String], values: [Double]) {
            var dataEntries: [ChartDataEntry] = []
            
            for i in 0..<dataPoints.count {
                let dataEntry = ChartDataEntry(x: Double(i), y: values[i], data: dataPoints as AnyObject)
                //let dataEntry = ChartDataEntry(x: Double(i), y: unitsSold[i])
                dataEntries.append(dataEntry)
            }
            let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "M")
            let lineChartData = LineChartData( dataSet: lineChartDataSet)
            lineChartView.data = lineChartData
        }
        
        setChart(dataPoints: xaxis, values: [dataModel.getMemoryTotal()]);
        //end of chart
        
        self.currentH += self.BlockH*7;
        //self.currentW += self.popupWidth * 0.5;
        let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: self.popupWidth, height: self.BlockH));
        buttonSettings(myButton: button, myTitle: "Exit", myBackgroundColor: UIColor(displayP3Red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0), myTitleColor: UIColor.black, myTag: 1);
        button.layer.cornerRadius = 8;
        
        self.view.addSubview(self.textField_1!);
        self.view.addSubview(self.lineChartView)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    @objc func buttonAction(sender: UIButton!){
        let tag = sender.tag;
        sender.showsTouchWhenHighlighted = true;

        if(tag == 1){//Display Var
            dismiss(animated: true, completion: nil);
        }
        if(tag == 5){
        }
    }
}

