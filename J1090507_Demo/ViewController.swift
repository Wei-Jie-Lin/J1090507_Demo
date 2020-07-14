//
//  ViewController.swift
//  J1090507_Demo
//
//  Created by Jay Lin on 2020/5/7.
//  Copyright © 2020 Jay Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Button(_ sender: UIButton) {
        
        print("; ")
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigation Bar透明
        let barAppearance =  UINavigationBarAppearance()
        barAppearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = barAppearance
        
        
        //取字型名稱
        if let url = Bundle.main.url(forResource: "crayon_1-1", withExtension: "ttf") as CFURL? , let provider = CGDataProvider(url: url), let font = CGFont(provider) {
             print(font.postScriptName)
        }
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        
        // Do any additional setup after loading the view.
    }


}

