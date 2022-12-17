//
//  LengthViewController.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/2/22.
//

import Foundation
import UIKit

final class LengthViewController: UIViewController, Storyboardable {
    @IBOutlet private(set) weak var inputLengthTextField: UITextField!
    @IBOutlet private(set) weak var inchLabel: UILabel!
    @IBOutlet private(set) weak var centimeterLabel: UILabel!
    @IBOutlet private(set) weak var feetLabel: UILabel!
    @IBOutlet private(set) weak var yardLabel: UILabel!

    private var lengthViewModel: LengthVM = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputLengthTextField.keyboardType = UIKeyboardType.decimalPad
        
        let lengthToolbarDone = UIToolbar.init()
        lengthToolbarDone.sizeToFit()
        let lengthFlexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let lengthBarBtnDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(donePressed(sender:)))
        
        lengthToolbarDone.items = [lengthFlexibleSpace, lengthBarBtnDone]
        self.inputLengthTextField.inputAccessoryView = lengthToolbarDone
        
    }
}

// MARK: - @IBActions
extension LengthViewController {
    @objc private func donePressed(sender: Any) {
        self.inputLengthTextField.resignFirstResponder()
        guard let unwrappedLengthInput = inputLengthTextField.text,
              let lengthValue = Double(unwrappedLengthInput) else {return}
        
        switch lengthViewModel.lengthConversion {
        case .inch: lengthViewModel.refreshLengthData(from: lengthValue, from: .inch)
        case .centimeter: lengthViewModel.refreshLengthData(from: lengthValue, from: .centimeter)
        case .feet: lengthViewModel.refreshLengthData(from: lengthValue, from: .feet)
        case .yard: lengthViewModel.refreshLengthData(from: lengthValue, from: .yard)
        }
        updateLengthLabels()
    }
    
    @IBAction func inputLengthTypeSelected(sender: UISegmentedControl) {
        guard let lengthType = LengthType(rawValue: sender.selectedSegmentIndex) else {
            self.lengthViewModel.lengthConversion = .inch
            return
        }
        self.lengthViewModel.lengthConversion = lengthType
        
        guard let unwrappedLengthInput = inputLengthTextField.text,
              let lengthValue = Double(unwrappedLengthInput) else {return}
        
        switch lengthViewModel.lengthConversion {
        case .inch: lengthViewModel.refreshLengthData(from: lengthValue, from: .inch)
        case .centimeter: lengthViewModel.refreshLengthData(from: lengthValue, from: .centimeter)
        case .feet: lengthViewModel.refreshLengthData(from: lengthValue, from: .feet)
        case .yard: lengthViewModel.refreshLengthData(from: lengthValue, from: .yard)
        }
        updateLengthLabels()
    }
}

// MARK: - Length Helper Methods
extension LengthViewController {
    func updateLengthLabels() {
        inchLabel.attributedText = lengthViewModel.inch
        centimeterLabel.attributedText = lengthViewModel.centimeter
        feetLabel.attributedText = lengthViewModel.foot
        yardLabel.attributedText = lengthViewModel.yard
    }
}

/*
inch to inch
1in = 1in

inch to centimeter
1in = 2.54cm
Mulitply by 2.54
 
inch to foot
1in = 0.0833333
Divide by 12
 
 inch to yard
 1in = 0.0277778
 Divide by 36
*/
