//
//  GMEAlertViewController.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 02/07/2019.
//  Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var messageLabel: UILabel!
  @IBOutlet private weak var rightButton: UIButton!
  @IBOutlet private weak var leftButton: UIButton!
  @IBOutlet private weak var mainView: UIView!
  @IBOutlet private weak var transParentView: UIView!
  
  private var rightButtonAction: (() -> Void)?
  private var leftButtonAction: (() -> Void)?
  
  private var titleText: String?
  private var messageText: String?
  private var rightButtonTitle: String?
  private var leftButtonTitle: String?
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  init(
    title: String? = "Alert",
    message: String? = nil,
    rightButtonTitle: String = "Ok",
    leftButtonTitle: String? = nil,
    rightButtonAction: (() -> Void)? = nil,
    leftButtonAction: (() -> Void)? = nil
    ) {
    super.init(nibName: "CustomAlertViewController", bundle: nil)
    
    self.titleText = title
    self.messageText = message
    self.rightButtonTitle = rightButtonTitle
    self.leftButtonTitle = leftButtonTitle
    
    self.rightButtonAction = rightButtonAction
    self.leftButtonAction = leftButtonAction
    
    modalPresentationStyle = .overFullScreen
    modalTransitionStyle = .crossDissolve
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mainView.layer.cornerRadius = 5
    
    titleLabel.text = titleText
    messageLabel.text = messageText
    
    rightButton.setTitle(rightButtonTitle, for: .normal)
    leftButton.setTitle(leftButtonTitle, for: .normal)
    
    if leftButtonTitle == nil {
      leftButton.isEnabled = false
      leftButton.isHidden = true
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    mainView.popUpBouncy()
  }
  
  @IBAction func touchRightButton(_ sender: UIButton) {
    self.rightButtonAction?()
    self.dismiss(animated: false, completion: nil)
  }
  
  
  @IBAction func touchLeftButton(_ sender: UIButton) {
    self.leftButtonAction?()
    self.dismiss(animated: false, completion: nil)
  }
  
}

extension UIView {
  func popUpBouncy(duration: Double = 0.1) {
    alpha = 0.0
    let transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    self.transform = transform
    
    UIView.animate(
      withDuration:duration,
      delay: duration,
      usingSpringWithDamping: 0.2,
      initialSpringVelocity: 10,
      animations: {
        self.alpha = 1.0
        let transform = CGAffineTransform(scaleX: 1, y: 1)
        self.transform = transform
      }
    )
  }
  
}
