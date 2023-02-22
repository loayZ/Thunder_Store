//
//  LoginViewController.swift
//  Login
//
//  Created by loay on 20/12/2022.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        validateFileds()
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "register")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated : true)
      
    }
    
    @IBAction func skipButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Home")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated : true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
    }
    
    func validateFileds(){
        if email.text?.isEmpty == true{
            
            print("No Email text")
            return
        }
        if password.text?.isEmpty == true{
            print("No Password text")
        return
        }
        
        login()
        
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) {
            [weak self] FIRAuthDataResult, Error in guard let strongSelf = self
            else {return}
            if let Error {
                print(Error.localizedDescription)
                return
            }
            self!.checkUserInfo()
        }
        
    }
    
    func checkUserInfo(){
        if Auth.auth().currentUser != nil{
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Home")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated : true)
        }
    }
    
}
