//
//  LaunchViewController.swift
//  Thunder_Store
//
//  Created by loay on 17/01/2023.
//

import UIKit
import OnboardKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let advanceButtonStyling: OnboardViewController.ButtonStyling = { button in
            button.setTitleColor(UIColor.red, for: .normal)
          button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        }
        let actionButtonStyling: OnboardViewController.ButtonStyling = { button in
          button.setTitleColor(.black, for: .normal)
          button.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .semibold)
          button.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
          button.layer.cornerRadius = button.bounds.height / 2.0
          button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
          button.layer.shadowColor = UIColor.black.cgColor
          button.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
          button.layer.shadowRadius = 2.0
          button.layer.shadowOpacity = 0.2
        }
        let appearance = OnboardViewController.AppearanceConfiguration(advanceButtonStyling:advanceButtonStyling,                                       actionButtonStyling: actionButtonStyling)
        let onboardingVC = OnboardViewController(pageItems: onboardingPages,
                                                 appearanceConfiguration: appearance)
    
        onboardingVC.modalPresentationStyle = .overFullScreen
        onboardingVC.presentFrom(self, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
