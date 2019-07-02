//
//  ViewController.swift
//  CustomAlertLikeKaKao
//
//  Created by InKwon Devik Kim on 02/07/2019.
//  Copyright © 2019 InKwon Devik Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func touchButton(_ sender: UIButton) {
    let customAlert: CustomAlertViewController
    
    switch sender.tag {
    case 0:
      customAlert = CustomAlertViewController(
        title: "Custom Alert",
        message: "These alert have a button"
      )
    case 1:
      customAlert = CustomAlertViewController(
        title: "Custom Alert",
        message: "These alert have two buttons",
        rightButtonTitle: "Ok",
        leftButtonTitle: "Cancel"
      )
    default:
      let message = "Welcome to the Swift community. Together we are working to build a programming language to empower everyone to turn their ideas into apps on any platform."
      
      customAlert = CustomAlertViewController(
        title: "Swift",
        message: message,
        rightButtonTitle: "Ok",
        leftButtonTitle: "Cancel"
      )
    }
    
    present(customAlert, animated: true, completion: nil)
    
  }
  
}

