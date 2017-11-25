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
    
    let txtField = UITextField(frame: CGRect(x:80,y:230,width:200,height:30))
    let txtField2 = UITextField(frame: CGRect(x:80,y:285,width:200,height:30))
    let txtField3 = UITextField(frame: CGRect(x:80,y:340,width:200,height:30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Your Profile"
        self.view.backgroundColor = UIColor.white
        
        //save button code
        let button = UIButton(frame: CGRect(x: 160, y: 380, width: 50, height: 25))
        button.backgroundColor = .black //originally black
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
        let label = UILabel(frame: CGRect(x:80,y:205,width:200,height:20))
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        label.text = "Name"
        
        let label2 = UILabel(frame: CGRect(x:80,y:265,width:200,height:20))
        label2.backgroundColor = UIColor.white
        label2.textColor = UIColor.black
        label2.textAlignment = NSTextAlignment.center
        label2.text = "Location"
        
        let label3 = UILabel(frame: CGRect(x:80,y:320,width:200,height:20))
        label3.backgroundColor = UIColor.white
        label3.textColor = UIColor.black
        label3.textAlignment = NSTextAlignment.center
        label3.text = "Description"
        
        var imageView : UIImageView
        imageView = UIImageView(frame: CGRect(x:130 , y:100, width: 100,height: 100))
        imageView.image = UIImage(named:"bobswaget.png")
        
        //creating buttons for each individual video game
        let lolbutton = UIButton(frame: CGRect(x: 20, y: 420, width: 50, height: 50))
        lolbutton.backgroundColor = .white
        lolbutton.addTarget(self, action: #selector(gameButton), for: .touchUpInside)
        lolbutton.setImage(UIImage(named: "lol.png"), for: .normal)
        
        let csgobutton = UIButton(frame: CGRect(x: 90, y: 420, width: 50, height: 50))
        csgobutton.backgroundColor = .white
        csgobutton.addTarget(self, action: #selector(gameButton), for: .touchUpInside)
        csgobutton.setImage(UIImage(named: "csgo.png"), for: .normal)
        
        let pubgbutton = UIButton(frame: CGRect(x: 160, y: 420, width: 50, height: 50))
        pubgbutton.backgroundColor = .white
        pubgbutton.addTarget(self, action: #selector(gameButton), for: .touchUpInside)
        pubgbutton.setImage(UIImage(named: "pubg.png"), for: .normal)
        
        let overwatchbutton = UIButton(frame: CGRect(x: 230, y: 420, width: 50, height: 50))
        overwatchbutton.backgroundColor = .white
        overwatchbutton.addTarget(self, action: #selector(gameButton), for: .touchUpInside)
        overwatchbutton.setImage(UIImage(named: "overwatch.png"), for: .normal)
        
        let hsbutton = UIButton(frame: CGRect(x: 300, y: 420, width: 50, height: 50))
        hsbutton.backgroundColor = .white
        hsbutton.addTarget(self, action: #selector(gameButton), for: .touchUpInside)
        hsbutton.setImage(UIImage(named: "hs.png"), for: .normal)
        
        /////////////
        
        let osrsbutton = UIButton(frame: CGRect(x: 20, y: 490, width: 50, height: 50))
        osrsbutton.backgroundColor = .white
        osrsbutton.addTarget(self, action: #selector(gameButton), for: .touchUpInside)
        osrsbutton.setImage(UIImage(named: "osrs.png"), for: .normal)
        
        let dota2button = UIButton(frame: CGRect(x: 90, y: 490, width: 50, height: 50))
        dota2button.backgroundColor = .white
        dota2button.addTarget(self, action: #selector(gameButton), for: .touchUpInside)
        dota2button.setImage(UIImage(named: "dota2.png"), for: .normal)
        
        let wowbutton = UIButton(frame: CGRect(x: 160, y: 490, width: 50, height: 50))
        wowbutton.backgroundColor = .white
        wowbutton.addTarget(self, action: #selector(gameButton), for: .touchUpInside)
        wowbutton.setImage(UIImage(named: "wow.png"), for: .normal)
        
        let ssbmbutton = UIButton(frame: CGRect(x: 230, y: 490, width: 50, height: 50))
        ssbmbutton.backgroundColor = .white
        ssbmbutton.addTarget(self, action: #selector(gameButton), for: .touchUpInside)
        ssbmbutton.setImage(UIImage(named: "ssbm-1.png"), for: .normal)
        
        let sc2button = UIButton(frame: CGRect(x: 300, y: 490, width: 50, height: 50))
        sc2button.backgroundColor = .white
        sc2button.addTarget(self, action: #selector(gameButton), for: .touchUpInside)
        sc2button.setImage(UIImage(named: "sc2.png"), for: .normal)
        
        
        self.view.addSubview(button)
        self.view.addSubview(txtField)
        self.view.addSubview(txtField2)
        self.view.addSubview(txtField3)
        self.view.addSubview(label)
        self.view.addSubview(label2)
        self.view.addSubview(label3)
        self.view.addSubview(imageView)
        
        //displaying video game buttons
        self.view.addSubview(lolbutton)
       self.view.addSubview(csgobutton)
       self.view.addSubview(overwatchbutton)
       self.view.addSubview(pubgbutton)
      self.view.addSubview(hsbutton)
        
        self.view.addSubview(osrsbutton)
        self.view.addSubview(dota2button)
        self.view.addSubview(wowbutton)
        self.view.addSubview(ssbmbutton)
        self.view.addSubview(sc2button)
        
        
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        
        //if the user edits the values, they will be saved by pressing the save button
        mName = txtField.text!
        mLoc = txtField2.text!
        mDesc = txtField3.text!
    
    }
    
    @objc func gameButton(sender: UIButton!, vgName: Bool){
        print("video game button pressed")
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
