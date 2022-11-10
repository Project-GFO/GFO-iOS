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
    
    var IsSecurePassword = false
    
    var eyesButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PasswordShownImage()
        eyesButton.addTarget(self, action: #selector(eyesButtonsDidTap(_:)), for: .touchUpInside)
    }
    
    private func PasswordShownImage() {
        eyesButton = UIButton.init(primaryAction: UIAction(handler: {[self]_ in textfieldpassword.isSecureTextEntry.toggle()}))
        var ButtonConfiguration = UIButton.Configuration.plain()
        ButtonConfiguration.imagePadding = 10
        ButtonConfiguration.baseBackgroundColor = .clear
        self.eyesButton.setImage(UIImage(systemName: IsSecurePassword ? "eye.slash" : "eyes"), for: .normal)
        self.eyesButton.configuration = ButtonConfiguration
        
        self.textfieldpassword.rightView = eyesButton
        self.textfieldpassword.rightViewMode = .always
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textfieldEmailid.resignFirstResponder()
        self.textfieldpassword.resignFirstResponder()
        return true
    }

    @objc func eyesButtonsDidTap(_ sender: UIButton) {
        IsSecurePassword.toggle()
        self.eyesButton.setImage(UIImage(systemName: IsSecurePassword ? "eye.slash" : "eyes"), for: .normal)
    }
}
