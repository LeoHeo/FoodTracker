//
//  ViewController.swift
//  FoodTracker
//
//  Created by JinHan on 2017. 9. 30..
//  Copyright © 2017년 JinHan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var mealNameLabel: UILabel!

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear \(animated)")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear \(animated)")
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("viewWillDisappear \(animated)")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("viewDidDisappear \(animated)")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("viewDidLoad")
    nameTextField.delegate = self
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // Hide the keyboard
    print("should Return")
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    print("End Editing")
    mealNameLabel.text = textField.text
  }
  
  @IBAction func setDefaultLabelText(_ sender: UIButton) {
    mealNameLabel.text = "Default Text"
  }

}

