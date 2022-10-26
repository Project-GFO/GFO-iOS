//
//  ViewController.swift
//  GsmForum
//
//  Created by 정윤서 on 2022/10/13.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{


    @IBOutlet weak var textfieldEmailid: UITextField!
    
    
    @IBOutlet weak var textfieldpassword: UITextField!
    
    @IBAction func showpass(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfieldEmailid.delegate = self
        textfieldpassword.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textfieldEmailid.resignFirstResponder()
        self.textfieldpassword.resignFirstResponder()
        return true
    }

    @IBAction func buttonsignin(_ sender: Any) {
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}

