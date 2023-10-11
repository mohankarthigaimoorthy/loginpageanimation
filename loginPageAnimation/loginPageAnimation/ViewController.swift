//
//  ViewController.swift
//  loginPageAnimation
//
//  Created by Imcrinox Mac on 16/12/1444 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNametext: UITextField!
    @IBOutlet weak var passWordtext: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var centerUserName: NSLayoutConstraint!
    @IBOutlet weak var centerPassword: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginBtn.layer.cornerRadius = 5
        userNametext.layer.cornerRadius = 8
        passWordtext.layer.cornerRadius = 8
        userNametext.delegate = self
        passWordtext.delegate = self
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        centerUserName.constant -= view.bounds.width
        centerPassword.constant -= view.bounds.width
        loginBtn.alpha = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.00, options: .curveEaseOut,animations: {
            
            self.centerUserName.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
        }, completion:  nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.10, options: .curveEaseOut,animations: {
            
            self.centerPassword.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion:  nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.20,options:  .curveEaseOut, animations: {
            self.loginBtn.alpha = 1
        }, completion:  nil)
    }
    
    @IBAction func logInButton(_ sender: Any) {
        
        let bounds = self.loginBtn.bounds
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveLinear, animations: {
            
            self.loginBtn.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.loginBtn.isEnabled = false
        }, completion: { finished in self.loginBtn.isEnabled = true })
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true,completion:  nil)
        
      
    }

}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
