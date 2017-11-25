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
    
    //creating individual buttons for each game
    let lolbutton = UIButton(frame: CGRect(x: 20, y: 420, width: 50, height: 50))
    let csgobutton = UIButton(frame: CGRect(x: 90, y: 420, width: 50, height: 50))
    let pubgbutton = UIButton(frame: CGRect(x: 160, y: 420, width: 50, height: 50))
    let overwatchbutton = UIButton(frame: CGRect(x: 230, y: 420, width: 50, height: 50))
    let hsbutton = UIButton(frame: CGRect(x: 300, y: 420, width: 50, height: 50))
    
    let osrsbutton = UIButton(frame: CGRect(x: 20, y: 490, width: 50, height: 50))
    let dota2button = UIButton(frame: CGRect(x: 90, y: 490, width: 50, height: 50))
    let wowbutton = UIButton(frame: CGRect(x: 160, y: 490, width: 50, height: 50))
    let ssbmbutton = UIButton(frame: CGRect(x: 230, y: 490, width: 50, height: 50))
    let sc2button = UIButton(frame: CGRect(x: 300, y: 490, width: 50, height: 50))
    
    var lolbool = true
    var csgobool = true
    var pubgbool = true
    var overwatchbool = true
    var hsbool = true
    var osrsbool = true
    var dota2bool = true
    var wowbool = true
    var ssbmbool = true
    var sc2bool = true
    
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
        
        //modifying buttons for each individual video game
        
        lolbutton.backgroundColor = .white
        lolbutton.addTarget(self, action: #selector(gameButtonlol), for: .touchUpInside)
        lolbutton.setImage(UIImage(named: "lol.png"), for: .normal)
        
        csgobutton.backgroundColor = .white
        csgobutton.addTarget(self, action: #selector(gameButtoncsgo), for: .touchUpInside)
        csgobutton.setImage(UIImage(named: "csgo.png"), for: .normal)
        
        pubgbutton.backgroundColor = .white
        pubgbutton.addTarget(self, action: #selector(gameButtonpubg), for: .touchUpInside)
        pubgbutton.setImage(UIImage(named: "pubg.png"), for: .normal)
        
        overwatchbutton.backgroundColor = .white
        overwatchbutton.addTarget(self, action: #selector(gameButtonoverwatch), for: .touchUpInside)
        overwatchbutton.setImage(UIImage(named: "overwatch.png"), for: .normal)
        
        hsbutton.backgroundColor = .white
        hsbutton.addTarget(self, action: #selector(gameButtonhs), for: .touchUpInside)
        hsbutton.setImage(UIImage(named: "hs.png"), for: .normal)
        
        /////////////
        
        
        osrsbutton.backgroundColor = .white
        osrsbutton.addTarget(self, action: #selector(gameButtonosrs), for: .touchUpInside)
        osrsbutton.setImage(UIImage(named: "osrs.png"), for: .normal)
        
        dota2button.backgroundColor = .white
        dota2button.addTarget(self, action: #selector(gameButtondota2), for: .touchUpInside)
        dota2button.setImage(UIImage(named: "dota2.png"), for: .normal)
        
        wowbutton.backgroundColor = .white
        wowbutton.addTarget(self, action: #selector(gameButtonwow), for: .touchUpInside)
        wowbutton.setImage(UIImage(named: "wow.png"), for: .normal)
        
        ssbmbutton.backgroundColor = .white
        ssbmbutton.addTarget(self, action: #selector(gameButtonssbm), for: .touchUpInside)
        ssbmbutton.setImage(UIImage(named: "ssbm-1.png"), for: .normal)
        
        sc2button.backgroundColor = .white
        sc2button.addTarget(self, action: #selector(gameButtonsc2), for: .touchUpInside)
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
    
    @objc func gameButtonlol(sender: UIButton!){
        print("video game button pressed")
        if lolbool{
            lolbutton.alpha = 0.5
            lolbool = false
        }
        else
        { lolbutton.alpha = 1
            lolbool = true
        }
    }
    
    @objc func gameButtoncsgo(sender: UIButton!){
        print("video game button pressed")
        if csgobool{
            csgobutton.alpha = 0.5
            csgobool = false
        }
        else
        { csgobutton.alpha = 1
            csgobool = true
        }
    }
    
    @objc func gameButtonpubg(sender: UIButton!){
        print("video game button pressed")
        if pubgbool{
            pubgbutton.alpha = 0.5
            pubgbool = false
        }
        else
        { pubgbutton.alpha = 1
            pubgbool = true
        }
    }
    
    @objc func gameButtonoverwatch(sender: UIButton!){
        print("video game button pressed")
        if overwatchbool{
            overwatchbutton.alpha = 0.5
            overwatchbool = false
        }
        else
        { overwatchbutton.alpha = 1
            overwatchbool = true
        }
    }
    
    @objc func gameButtonhs(sender: UIButton!){
        print("video game button pressed")
        if hsbool{
            hsbutton.alpha = 0.5
            hsbool = false
        }
        else
        { hsbutton.alpha = 1
            hsbool = true
        }
    }
    
    @objc func gameButtonosrs(sender: UIButton!){
        print("video game button pressed")
        if osrsbool{
            osrsbutton.alpha = 0.5
            osrsbool = false
        }
        else
        { osrsbutton.alpha = 1
            osrsbool = true
        }
    }
    
    @objc func gameButtondota2(sender: UIButton!){
        print("video game button pressed")
        if dota2bool{
            dota2button.alpha = 0.5
            dota2bool = false
        }
        else
        { dota2button.alpha = 1
            dota2bool = true
        }
    }
    
    @objc func gameButtonssbm(sender: UIButton!){
        print("video game button pressed")
        if ssbmbool{
            ssbmbutton.alpha = 0.5
            ssbmbool = false
        }
        else
        { ssbmbutton.alpha = 1
            ssbmbool = true
        }
    }
    
    @objc func gameButtonsc2(sender: UIButton!){
        print("video game button pressed")
        if sc2bool{
            sc2button.alpha = 0.5
            sc2bool = false
        }
        else
        { sc2button.alpha = 1
            sc2bool = true
        }
    }
    
    @objc func gameButtonwow(sender: UIButton!){
        print("video game button pressed")
        if wowbool{
            wowbutton.alpha = 0.5
            wowbool = false
        }
        else
        { wowbutton.alpha = 1
            wowbool = true
        }
    }
    
    @objc func gameButton(sender: UIButton!){
        print("video game button pressed")

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
