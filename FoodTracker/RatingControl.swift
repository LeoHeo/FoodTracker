//
//  RatingControl.swift
//  FoodTracker
//
//  Created by JinHan on 2017. 10. 2..
//  Copyright © 2017년 JinHan. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
  
  // MARK: properties
  @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0)
  @IBInspectable var starCount: Int = 5
  private var ratingButtons = [UIButton]()
  var rating = 0
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupButtons()
  }
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    setupButtons()
  }
  
  // MARK: button the action
  @objc func ratingButtonTaped(button: UIButton) {
    print("Button pressed")
  }
  
  // MARK: Private method
  private func setupButtons() {
    for _ in 0..<starCount {
      // Create the button
      let button = UIButton()
      button.backgroundColor = UIColor.red
      
      // Add constraints
      button.translatesAutoresizingMaskIntoConstraints = false
      button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
      button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
      
      // Setup the button action
      button.addTarget(self, action: #selector(RatingControl.ratingButtonTaped(button:)), for: .touchUpInside)
      
      // Add the button to the stack
      addArrangedSubview(button)
      
      // Add the new button to the rating button array
      ratingButtons.append(button)
    }
  }
}
