//
//  ViewController.swift
//  SignUp
//
//  Created by AnnKangHo on 2022/10/18.
//
import UIKit

    class ViewController: UIViewController {
        
        @IBOutlet var defaultHiddenCollection: [UILabel]!
        
        @IBOutlet weak var idTextField: UITextField!
        @IBOutlet weak var idTextFieldDescription: UILabel!
        
        @IBOutlet weak var passwordTextField: UITextField!
        @IBOutlet weak var passwordTextFieldDescription: UILabel!
        
        @IBOutlet weak var emailTextField: UITextField!
        @IBOutlet weak var emailTextFieldDescription: UILabel!
        
        @IBOutlet weak var samepasswordTextField: UITextField!
        @IBOutlet weak var samepasswordTextFieldDescription: UILabel!
        
        var isSecurePassword = true
        
        var eyeButton = UIButton(type : .custom)
        
        var eyeeButton = UIButton(type : .custom)
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setsamepasswordShownImage()
            eyeeButton.addTarget(self, action: #selector(eyeeButtonDidTap(_:)), for: .touchUpInside)
            
            setpasswordShownImage()
            eyeButton.addTarget(self, action: #selector(eyeButtonDidTap(_:)), for: .touchUpInside)
            
            for label in defaultHiddenCollection {
                label.isHidden = true
                label.textColor = .red
                emailTextFieldDescription.isHidden = true
            
            }
            
        }
        private func setsamepasswordShownImage(){
            eyeeButton = .init()
            samepasswordTextField.isSecureTextEntry = isSecurePassword
            var buttonConfiguration = UIButton.Configuration.plain()
            buttonConfiguration.imagePadding = 10
            buttonConfiguration.baseBackgroundColor = .clear
            self.eyeeButton.setImage(UIImage(systemName: isSecurePassword ? "eyes" : "eyes.inverse"), for: .normal)
            self.eyeeButton.configuration = buttonConfiguration
            
            self.samepasswordTextField.rightView = eyeeButton
            self.samepasswordTextField.rightViewMode = .always
        }
        private func setpasswordShownImage(){
            eyeButton = .init()
            passwordTextField.isSecureTextEntry = isSecurePassword
            var buttonConfiguration = UIButton.Configuration.plain()
            buttonConfiguration.imagePadding = 10
            buttonConfiguration.baseBackgroundColor = .clear
            self.eyeButton.setImage(UIImage(systemName: isSecurePassword ? "eyes" : "eyes.inverse"), for: .normal)
            self.eyeButton.configuration = buttonConfiguration
            
            self.passwordTextField.rightView = eyeButton
            self.passwordTextField.rightViewMode = .always
        }
        @IBAction func idTextFieldTyped(_ sender: UITextField) {
            idTextFieldDescription.isHidden = false
            
            let userWord = idTextField.text?.lowercased()
            idTextField.text = userWord
            
            let minCount = 5
            let maxCount = 12
            let count = userWord!.count

            switch count {
            case 0:
                idTextFieldDescription.text = "아이디는 필수입력 정보입니다."
            case 1..<minCount:
                idTextFieldDescription.text = "아이디는 5글자 이상이어야 합니다."
            case minCount...maxCount:
                let idPattern = "^[a-z0-9-_]{\(minCount),\(maxCount)}$"
                let isVaildPattern = (userWord!.range(of: idPattern, options: .regularExpression) != nil)
                if isVaildPattern {
                    idTextFieldDescription.text = "조건에 맞는 아이디"
                    idTextFieldDescription.isHidden = true
                } else {
                    idTextFieldDescription.text = "소문자, 숫자, 빼기(-), 밑줄(_)만 사용할 수 있습니다."
                }
            default:
                idTextFieldDescription.text = "아이디는 12글자 이하이어야 합니다."
            }
        }
        
        @IBAction func passwordTextFieldTyped(_ sender: UITextField) {
            passwordTextFieldDescription.isHidden = false
            
            let minCount = 8
            let maxCount = 16
            let count = passwordTextField.text!.count

            switch count {
            case 0:
                passwordTextFieldDescription.text = "비밀번호는 필수입력 정보입니다."
            case 1..<minCount:
                passwordTextFieldDescription.text = "비밀번호는 8글자 이상이어야 합니다."
            case minCount...maxCount:
                let idPattern = #"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{\#(minCount),\#(maxCount)}$"#
                let isVaildPattern = (passwordTextField.text!.range(of: idPattern, options: .regularExpression) != nil)
                if isVaildPattern {
                    passwordTextFieldDescription.text = "조건에 맞는 비밀번호"
                    passwordTextFieldDescription.isHidden = true
                } else {
                    passwordTextFieldDescription.text = "영어알파벳, 숫자, 특수문자가 필수로 입력되어야 합니다."
                }
            default:
                passwordTextFieldDescription.text = "비밀번호는 16글자 이하이어야 합니다."
            }
        }
        
        @IBAction func SamepasswordTextFieldTyped(_ sender: UITextField){
            samepasswordTextFieldDescription.isHidden = false
            if samepasswordTextField.text!.isEmpty {
                samepasswordTextFieldDescription.text = "비밀번호를 입력해주세요!"
            }
            else if samepasswordTextField.text == passwordTextField.text {
                samepasswordTextFieldDescription.text = ""
            }
        }

        @IBAction func emailTextFieldTyped(_ sender: UITextField) {
            emailTextFieldDescription.isHidden = false
            
            let idPattern = #"^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"#
            let isVaildPattern = (emailTextField.text!.range(of: idPattern, options: .regularExpression) != nil)
            
            if emailTextField.text!.isEmpty {
                emailTextFieldDescription.text = "이메일은 필수로 입력해야합니다"
            } else if isVaildPattern {
                emailTextFieldDescription.text = "조건에 맞는 이메일"
                emailTextFieldDescription.isHidden = true
            } else {
                emailTextFieldDescription.text = "올바르지 않은 이메일 형식입니다"
            }
        }
        
        @objc func eyeButtonDidTap(_ sender: UIButton) {
            isSecurePassword.toggle()
            self.eyeButton.setImage(UIImage(systemName: isSecurePassword ? "eyes" : "eyes.inverse"), for: .normal)
            passwordTextField.isSecureTextEntry = isSecurePassword
        }
        
        @objc func eyeeButtonDidTap(_ sender: UIButton) {
            isSecurePassword.toggle()
            self.eyeeButton.setImage(UIImage(systemName: isSecurePassword ? "eyes" : "eyes.inverse"), for: .normal)
            samepasswordTextField.isSecureTextEntry = isSecurePassword
        }
    }
