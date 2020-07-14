//
//  ViewControllerPage3.swift
//  J1090507_Demo
//
//  Created by Jay Lin on 2020/7/14.
//  Copyright © 2020 Jay Lin. All rights reserved.
//

import UIKit

class ViewControllerPage3: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func touchDown(_ sender: Any) {
        textField.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardObserver()
        // Do any additional setup after loading the view.
    }
}
    extension ViewControllerPage3 {
        func addKeyboardObserver() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        @objc func keyboardWillShow(notification: Notification) {
            // 能取得鍵盤高度就讓view上移鍵盤高度，否則上移view的1/3高度
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRect = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRect.height
                view.frame.origin.y = -keyboardHeight / 3
            } else {
                view.frame.origin.y = -view.frame.height / 3
            }
        }
        
        @objc func keyboardWillHide(notification: Notification) {
            view.frame.origin.y = 0
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(true)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


