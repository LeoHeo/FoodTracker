//
//  ViewController.swift
//  FoodTracker
//
//  Created by JinHan on 2017. 9. 30..
//  Copyright © 2017년 JinHan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var mealNameLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var ratingControl: RatingControl!
  
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
  
  @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
    
    // Hide the keyboard
    nameTextField.resignFirstResponder()
    
    // UIImagePickerController is a view controller that lets a user pick media from their photo Library
    let imagePickerController = UIImagePickerController()
    
    // Only allow to be pikced, not taken
    imagePickerController.sourceType = .photoLibrary
    
    // Make sure ViewController notified when the user picks an image
    imagePickerController.delegate = self
    
    present(imagePickerController, animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    print("imagePickerControllerDidCancel")
    
    // Dismiss the picker if the user canceled
    // Photo Library에서 cancel을 눌렀을때
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
      fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
    }
    
    print("selected image")
    
    // Set photoImageView to display the selected image
    photoImageView.image = selectedImage
    
    // Dismiss the picker
    dismiss(animated: true, completion: nil)
  }
}

