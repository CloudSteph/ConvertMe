//
//  MassViewController.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/2/22.
//

import Foundation
import UIKit

final class MassViewController: UIViewController, Storyboardable {
    @IBOutlet private(set) weak var inputMassTextField: UITextField!
    @IBOutlet private(set) weak var kilogramLabel: UILabel!
    @IBOutlet private(set) weak var gramLabel: UILabel!
    @IBOutlet private(set) weak var ounceLabel: UILabel!
    @IBOutlet private(set) weak var poundLabel: UILabel!
    
    private var viewModel: MeasurementVM = .init()
    private var massConversion: MassType = .kilogram
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let massToolbarDone = UIToolbar.init()
        massToolbarDone.sizeToFit()
        let massFlexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let massBarBtnDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.done,
                                              target: self, action: #selector(doneTapped(sender:)))
        
        massToolbarDone.items = [massFlexibleSpace, massBarBtnDone]
        self.inputMassTextField.inputAccessoryView = massToolbarDone
        
        inputMassTextField.keyboardType = UIKeyboardType.decimalPad
    }
}

// MARK: - Conversions
extension MassViewController {
    @objc private func doneTapped(sender: Any) {
        self.inputMassTextField.resignFirstResponder()
        guard let unwrappedInput = inputMassTextField.text,
              let value = Double(unwrappedInput) else { return }
        
        switch massConversion {
        case .kilogram: startMassConversions(from: value, from: .kilogram)
        case .gram: startMassConversions(from: value, from: .gram)
        case .ounce: startMassConversions(from: value, from: .ounce)
        case .pound: startMassConversions(from: value, from: .pound)
        }
    }
}

// MARK: - Helper Methods
extension MassViewController {
    func startMassConversions(from value: Double, from massType: MassType) {
        switch massType {
        case .kilogram:
            let converter = Measurement(value: value, unit: UnitMass.kilograms)
            self.kilogramLabel.text = converter.converted(to: .kilograms).value.unitFormat()
            self.gramLabel.text = converter.converted(to: .grams).value.unitFormat()
            self.ounceLabel.text = converter.converted(to: .ounces).value.unitFormat()
            self.poundLabel.text = converter.converted(to: .pounds).value.unitFormat()
        case .gram:
            let converter = Measurement(value: value, unit: UnitMass.grams)
            self.kilogramLabel.text = converter.converted(to: .kilograms).value.unitFormat()
            self.gramLabel.text = converter.converted(to: .grams).value.unitFormat()
            self.ounceLabel.text = converter.converted(to: .ounces).value.unitFormat()
            self.poundLabel.text = converter.converted(to: .pounds).value.unitFormat()
        case .ounce:
            let converter = Measurement(value: value, unit: UnitMass.ounces)
            self.kilogramLabel.text = converter.converted(to: .kilograms).value.unitFormat()
            self.gramLabel.text = converter.converted(to: .grams).value.unitFormat()
            self.ounceLabel.text = converter.converted(to: .ounces).value.unitFormat()
            self.poundLabel.text = converter.converted(to: .pounds).value.unitFormat()
        case .pound:
            let converter = Measurement(value: value, unit: UnitMass.pounds)
            self.kilogramLabel.text = converter.converted(to: .kilograms).value.unitFormat()
            self.gramLabel.text = converter.converted(to: .grams).value.unitFormat()
            self.ounceLabel.text = converter.converted(to: .ounces).value.unitFormat()
            self.poundLabel.text = converter.converted(to: .pounds).value.unitFormat()
        }
    }
}

// MARK: - IBActions
extension MassViewController {
    @IBAction func inputMassTypeSelected(sender: UISegmentedControl) {
        guard let massType = MassType(rawValue: sender.selectedSegmentIndex) else {
            self.massConversion = .kilogram
            return
        }
        self.massConversion = massType
        
        guard let unwrappedInput = inputMassTextField.text,
              let value = Double(unwrappedInput) else { return }
        
        switch massConversion {
        case .kilogram: startMassConversions(from: value, from: .kilogram)
        case .gram: startMassConversions(from: value, from: .gram)
        case .ounce: startMassConversions(from: value, from: .ounce)
        case .pound: startMassConversions(from: value, from: .pound)
        }
    }
    
}


/*
Kilogram to Kilogram
 1kg = 1kg
 Multiply by 1
 
Kilogram to gram
1kg = 1000g
Multiply by 1000

Kilogram to ounce
1kg = 35.274oz
Multiply by 35.274

Kilogram to Pound
1kg = 2.20462lb
Multiply by 2.205
 */


