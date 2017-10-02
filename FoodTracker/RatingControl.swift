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
  @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
    didSet {
      setupButtons()
    }
  }
  @IBInspectable var starCount: Int = 5 {
    didSet {
      setupButtons()
    }
  }
  var rating = 0 {
    didSet {
      updateButtonSelectionStates()
    }
  }
  private var ratingButtons = [UIButton]()
  
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
    guard let index = ratingButtons.index(of: button) else {
      fatalError("The button, \(button), is not in the ratingButtons array \(ratingButtons)")
    }
    
    // Calculate the rating of the selected button
    let selectedRating = index + 1
    
    // If the selected star represents the current rating, reset the rating to 0
    // Otherwise set the rating to the selected star
    rating = selectedRating == rating ? 0 : selectedRating
  }
  
  private func updateButtonSelectionStates() {
    for (index, button) in ratingButtons.enumerated() {
      // If the index of a button is less than the rating, that button should be selected.
      print("index: \(index), rating \(rating)")
      button.isSelected = index < rating
      
      // Set the hint string for the currently selected star
      let hintString = rating == index + 1 ? "Tap to reset the rating to zero." : nil
      
      let valueString: String
      switch(rating) {
      case 0:
        valueString = "No rating set."
      case 1:
        valueString = "I star set."
      default:
        valueString = "\(rating) stars set."
      }
      
      // Assign the hint string and value string
      button.accessibilityLabel = hintString
      button.accessibilityValue = valueString
    }
  }
  
  // MARK: Private method
  private func setupButtons() {
    // Load Button Images
    let bundle = Bundle(for: type(of: self))
    let filedStar = UIImage(named: "filedStar", in: bundle, compatibleWith: self.traitCollection)
    let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
    let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
    
    // clear any existing buttons
    for button in ratingButtons {
      removeArrangedSubview(button)
      button.removeFromSuperview()
    }
    
    ratingButtons.removeAll()
    
    for index in 0..<starCount {
      // Create the button
      let button = UIButton()
      
      // Set the button Images
      button.setImage(emptyStar, for: .normal)
      button.setImage(filedStar, for: .selected)
      button.setImage(highlightedStar, for: .highlighted)
      button.setImage(highlightedStar, for: [.highlighted, .selected])
      
      // Add constraints
      button.translatesAutoresizingMaskIntoConstraints = false
      button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
      button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
      
      // Set the accessibility label
      button.accessibilityLabel = "Set \(index + 1) star rating"
      
      // Setup the button action
      button.addTarget(self, action: #selector(RatingControl.ratingButtonTaped(button:)), for: .touchUpInside)
      
      // Add the button to the stack
      addArrangedSubview(button)
      
      // Add the new button to the rating button array
      ratingButtons.append(button)
    }
    
    updateButtonSelectionStates()
  }
}
