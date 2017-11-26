//
//  login.swift
//  Party
//
//  Created by Jared_Cook on 11/25/17.
//  Copyright © 2017 alan. All rights reserved.
//

import UIKit
import Foundation

import FacebookLogin
import FacebookCore

//import PerfectPostgreSQL

class loginView: UIViewController{
    
    //vars for UI
    var window: UIWindow?
    
    
    private var textField_1: UITextField!       //username
    private var textField_2: UITextField!       //password
    private var buttons = [UIButton]();         //Login //Create New User
    
    //vars for screen positioning
    private var currentW: CGFloat = 0.0;        //x-Coordinate
    private var currentH: CGFloat = 0.0;        //y-Coordinate
    
    private var WBlocks: CGFloat = 1;           //Number of Blocks wide
    private var HBlocks: CGFloat = 9;           //Number of Blocks tall
    
    private var BlockW: CGFloat!          //Block Width
    private var BlockH: CGFloat!          //Block Height
    
    private var screenWidth: CGFloat!
    private var screenHeight: CGFloat!
    
    func setCoordinates(myX: CGFloat, myY: CGFloat){
        self.currentW = myX;
        self.currentH = myY;
    }
    
    /*
    @objc func textField1DidBeginEditing(_ textField: UITextField) {
        if(self.textField_1.isEditing == false){
            //print("test");
            self.textField_1.text = "";
        }
        else{
            self.view.endEditing(true);
        }
    }
    
    @objc func textField2DidBeginEditing(_ textField: UITextField) {
        if(self.textField_2.isEditing == false){
            //print("test");
            self.textField_2.text = "";
        }
        else{
            self.view.endEditing(true);
        }
    }*/
    
    init() {
        super.init(nibName: nil, bundle: nil);
        //set itit coordinates
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sets the subview title
        self.title = "myLogin";
        
        //Collects Screen size before creating buttons
        let screenSize = UIScreen.main.bounds;
        screenWidth = screenSize.width;
        screenHeight = screenSize.height;
        //print(screenHeight);
        
        BlockW = screenWidth/WBlocks;          //Block Width
        BlockH = (screenHeight-20)/HBlocks;    //Block Height
        
        func buttonSettings(myButton:UIButton, myTitle:String, myBackgroundColor:UIColor, myTitleColor:UIColor, myTag:Int){
            //button.layer.cornerRadius = 5
            myButton.layer.borderWidth = 1;
            myButton.layer.borderColor = UIColor.black.cgColor;
            myButton.setTitleColor(myTitleColor, for: .normal);
            myButton.setTitle(String(myTitle), for: .normal);
            myButton.backgroundColor = myBackgroundColor;
            myButton.addTarget(self.view.inputViewController, action: #selector(buttonAction), for: .touchUpInside);
            myButton.tag=myTag;
            myButton.setTitleColor(.white, for: .normal);

            self.buttons.append(myButton);
            self.view.addSubview(myButton);
            //end
        }
        
        //self.view.backgroundColor = UIColor.white.withAlphaComponent(1.0);
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Aura_Silver-granite-iOS-11-GM-iPhone-wallpapers.jpg")!);


        //sets init coordinates
        self.setCoordinates(myX: screenWidth-(screenWidth/WBlocks), myY: screenHeight-(screenHeight-20));
        
        //facebook login
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends, .userLocation ])
        //loginButton.center = view.center
        self.currentH += self.BlockH*6;
        loginButton.center = CGPoint(x: screenWidth/2, y: self.currentH)
        //view.centerYAnchor
        
        
        /*
        self.textField_1 = UITextField(frame: CGRect(x: self.currentW, y: self.currentH, width: self.screenWidth, height: self.BlockH)); //x = 20, y = 100
        self.textField_1.text = "Username";
        self.textField_1.textAlignment = NSTextAlignment.center;
        self.textField_1.backgroundColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
        self.textField_1.borderStyle = UITextBorderStyle.roundedRect;
        //self.textField_1.textColor = UIColor.white;
        self.textField_1.addTarget(self, action: #selector(textField1DidBeginEditing), for: UIControlEvents.touchDown);
        //self.textField_1.addTarget(self, action: #selector(textFieldStopEditing), for: UIControlEvents.touchDown);
        
        //self.currentH += self.BlockH;
        //self.currentH += self.BlockH;
        self.textField_2 = UITextField(frame: CGRect(x: self.currentW, y: self.currentH, width: self.screenWidth, height: self.BlockH)); //x = 20, y = 100
        self.textField_2.text = "Password";
        self.textField_2.textAlignment = NSTextAlignment.center;
        self.textField_2.backgroundColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
        self.textField_2.borderStyle = UITextBorderStyle.roundedRect;
        self.textField_2.addTarget(self, action: #selector(textField2DidBeginEditing), for: UIControlEvents.touchDown);
        */
 
        for i in 0...1
        {
            if(i == 0){//Login
                self.currentW = 0;
                self.currentH += self.BlockH * 0.4;
                //self.currentH += self.BlockH;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: self.screenWidth/2.3, height: self.BlockH * 0.35));
                button.center = CGPoint(x: screenWidth/2, y: self.currentH)
                buttonSettings(myButton: button, myTitle: "Login", myBackgroundColor: UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0), myTitleColor: UIColor.black, myTag: i);
            }
            /*
            if(i == 1){//Create New User
                self.currentW = 0;
                self.currentH += self.BlockH * 0.6;
                self.currentH += self.BlockH * 0.3;
                let button = UIButton(frame: CGRect(x: self.currentW, y: self.currentH, width: self.screenWidth, height: self.BlockH * 0.6));
                buttonSettings(myButton: button, myTitle: "Create New User", myBackgroundColor: UIColor(displayP3Red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0), myTitleColor: UIColor.black, myTag: i);
            }
            */
        }
        //self.view.addSubview(self.textField_1!);
        //self.view.addSubview(self.textField_2!);
        view.addSubview(loginButton)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //when login button clicked
    /*
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                self.getFBUserData()
            }
        }
    }*/
    
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
        if(tag == 0){//Login
            print("Login");
            self.window = UIWindow(frame: UIScreen.main.bounds)
            if let accessToken = AccessToken.current {
                let nav1: UINavigationController = {
                    let t = TabFactory.standardTab(title: "List", VC: FirstViewController(nibName: nil, bundle: nil), image: #imageLiteral(resourceName: "listIconTab")).new
                    return t
                }()
                
                let nav2: UINavigationController = {
                    let t = TabFactory.standardTab(title: "Events", VC: SecondViewController(nibName: nil, bundle: nil), image: #imageLiteral(resourceName: "eventsIconTab")).new
                    return t
                }()
                
                let nav3: UINavigationController = {
                    let t = TabFactory.standardTab(title: "User Profile", VC: ThirdViewController(nibName: nil, bundle: nil), image: #imageLiteral(resourceName: "userIconTab")).new
                    return t
                }()
                
                
                let tabs = UITabBarController()
                tabs.viewControllers = [nav1, nav2, nav3]
                
                self.window!.rootViewController = tabs;
                self.window?.makeKeyAndVisible();
            }
        }
        if(tag == 1){//Create New User
            print("Create New User");
        }
    }
}
