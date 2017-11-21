//
//  ThirdViewController.swift
//  Party
//
//  Created by Jared_Cook on 10/23/17.
//  Copyright © 2017 alan. All rights reserved.
//
import UIKit
import Foundation

class ThirdViewController: UIViewController {
    
    var mName = "Bob Saget"
    var mLoc = "San Fransisco"
    var mDesc = "Everywhere You Look"
    
    let txtField = UITextField(frame: CGRect(x:100,y:230,width:200,height:30))
    let txtField2 = UITextField(frame: CGRect(x:100,y:310,width:200,height:30))
    let txtField3 = UITextField(frame: CGRect(x:100,y:400,width:200,height:30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Your Profile"
        self.view.backgroundColor = UIColor.white
        
        //ui button code
        let button = UIButton(frame: CGRect(x: 180, y: 450, width: 50, height: 25))
        button.backgroundColor = .black
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        //ui text field code need 3 of these
        
        txtField.backgroundColor = UIColor.black
        txtField.textColor = UIColor.white
        txtField.text = mName
        
        txtField2.backgroundColor = UIColor.black
        txtField2.textColor = UIColor.white
        txtField2.text = mLoc
        
       
        txtField3.backgroundColor = UIColor.black
        txtField3.textColor = UIColor.white
        txtField3.text = mDesc
        
        //uilabel code need 3 of these
        let label = UILabel(frame: CGRect(x:100,y:205,width:200,height:20))
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        label.text = "Name"
        
        let label2 = UILabel(frame: CGRect(x:100,y:290,width:200,height:20))
        label2.backgroundColor = UIColor.white
        label2.textColor = UIColor.black
        label2.textAlignment = NSTextAlignment.center
        label2.text = "Location"
        
        let label3 = UILabel(frame: CGRect(x:100,y:380,width:200,height:20))
        label3.backgroundColor = UIColor.white
        label3.textColor = UIColor.black
        label3.textAlignment = NSTextAlignment.center
        label3.text = "Description"
        
        
        var imageView : UIImageView
        imageView = UIImageView(frame: CGRect(x:150 , y:100, width: 100,height: 100))
        imageView.image = UIImage(named:"bobswaget.png")
        
        self.view.addSubview(button)
        self.view.addSubview(txtField)
        self.view.addSubview(txtField2)
        self.view.addSubview(txtField3)
        self.view.addSubview(label)
        self.view.addSubview(label2)
        self.view.addSubview(label3)
        self.view.addSubview(imageView)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        
        //if the user edits the values, they will be saved by pressing the save button
        mName = txtField.text!
        mLoc = txtField2.text!
        mDesc = txtField3.text!
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
