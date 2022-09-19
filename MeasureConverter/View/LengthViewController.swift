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
    
    
    private var lengthConversion: LengthType = .inch
    private var viewModel: MeasurementVM = .init()
    
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
        
        switch lengthConversion {
        case .inch: startLengthConversions(from: lengthValue, from: .inch)
        case .centimeter: startLengthConversions(from: lengthValue, from: .centimeter)
        case .feet: startLengthConversions(from: lengthValue, from: .feet)
        case .yard: startLengthConversions(from: lengthValue, from: .yard)
        }
    }
    
    @IBAction func inputLengthTypeSelected(sender: UISegmentedControl) {
        guard let lengthType = LengthType(rawValue: sender.selectedSegmentIndex) else {
            self.lengthConversion = .inch
            return
        }
        self.lengthConversion = lengthType
        
        guard let unwrappedLengthInput = inputLengthTextField.text,
              let lengthValue = Double(unwrappedLengthInput) else {return}
        
        switch lengthConversion {
        case .inch: startLengthConversions(from: lengthValue, from: .inch)
        case .centimeter: startLengthConversions(from: lengthValue, from: .centimeter)
        case .feet: startLengthConversions(from: lengthValue, from: .feet)
        case .yard: startLengthConversions(from: lengthValue, from: .yard)
        }
    }
}

// MARK: - Length Helper Methods
extension LengthViewController {
    func startLengthConversions(from lengthValue: Double, from lengthType: LengthType) {
        switch lengthType {
        case .inch:
            let lengthConverter = Measurement(value: lengthValue, unit: UnitLength.inches)
            self.inchLabel.text = lengthConverter.converted(to: UnitLength.inches).value.unitFormat()
            self.centimeterLabel.text = lengthConverter.converted(to: UnitLength.centimeters).value.unitFormat()
            self.feetLabel.text = lengthConverter.converted(to: UnitLength.feet).value.unitFormat()
            self.yardLabel.text = lengthConverter.converted(to: UnitLength.yards).value.unitFormat()
            
        case .centimeter:
            let lengthConverter = Measurement(value: lengthValue, unit: UnitLength.centimeters)
            self.inchLabel.text = lengthConverter.converted(to: UnitLength.inches).value.unitFormat()
            self.centimeterLabel.text = lengthConverter.converted(to: UnitLength.centimeters).value.unitFormat()
            self.feetLabel.text = lengthConverter.converted(to: UnitLength.feet).value.unitFormat()
            self.yardLabel.text = lengthConverter.converted(to: UnitLength.yards).value.unitFormat()
            
        case .feet:
            let lengthConverter = Measurement(value: lengthValue, unit: UnitLength.feet)
            self.inchLabel.text = lengthConverter.converted(to: UnitLength.inches).value.unitFormat()
            self.centimeterLabel.text = lengthConverter.converted(to: UnitLength.centimeters).value.unitFormat()
            self.feetLabel.text = lengthConverter.converted(to: UnitLength.feet).value.unitFormat()
            self.yardLabel.text = lengthConverter.converted(to: UnitLength.yards).value.unitFormat()
            
        case .yard:
            let lengthConverter = Measurement(value: lengthValue, unit: UnitLength.yards)
            self.inchLabel.text = lengthConverter.converted(to: UnitLength.inches).value.unitFormat()
            self.centimeterLabel.text = lengthConverter.converted(to: UnitLength.centimeters).value.unitFormat()
            self.feetLabel.text = lengthConverter.converted(to: UnitLength.feet).value.unitFormat()
            self.yardLabel.text = lengthConverter.converted(to: UnitLength.yards).value.unitFormat()
        }
    }
}

/*
inch to inch
1in = 1in

inch to centimeter
1in = 2.54cm
Mulitply by 2.54
 
inch to yard
1in = 0.0277778
Divide by 36
 
inch to foot
1in = 0.0833333
Divide by 12
*/
