//
//  RegisterViewController.swift
//  Login
//
//  Created by loay on 20/12/2022.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var repassword: UITextField!
    @IBAction func registerButton(_ sender: UIButton) {
        if email.text?.isEmpty == true{
            print("No text in email field")
            return
        }
        if password.text?.isEmpty == true{
            print("No text in password field")
            return
        }
        
        if password.text != repassword.text{
            print("password not match")
            return
        }
        
        signUp()
    }
    
    @IBAction func alreadyHaveAccButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!){
            (AuthDataResult,Error) in guard let user = AuthDataResult?.user, Error == nil else{
                print("Error \(Error?.localizedDescription)")
                return
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Home")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)        }
    }
}
