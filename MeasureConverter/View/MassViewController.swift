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
    
    private var massViewModel: MassVM = .init()
    
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
        switch massViewModel.massConversion {
        case .kilogram: massViewModel.refreshMassData(from: value, from: .kilogram)
        case .gram: massViewModel.refreshMassData(from: value, from: .gram)
        case .ounce: massViewModel.refreshMassData(from: value, from: .ounce)
        case .pound: massViewModel.refreshMassData(from: value, from: .pound)
        }
        updateMassLabels()
    }
}

// Mark: - Update Labels
extension MassViewController {
    func updateMassLabels() {
        kilogramLabel.attributedText = massViewModel.kilogram
        gramLabel.attributedText = massViewModel.gram
        ounceLabel.attributedText = massViewModel.ounce
        poundLabel.attributedText = massViewModel.pound
    }
}

// MARK: - IBActions
extension MassViewController {
    @IBAction func inputMassTypeSelected(sender: UISegmentedControl) {
        guard let massType = MassType(rawValue: sender.selectedSegmentIndex) else {
            self.massViewModel.massConversion = .kilogram
            return
        }
        self.massViewModel.massConversion = massType
        
        guard let unwrappedInput = inputMassTextField.text,
              let value = Double(unwrappedInput) else { return }
        
        switch massViewModel.massConversion {
        case .kilogram: massViewModel.refreshMassData(from: value, from: .kilogram)
        case .gram: massViewModel.refreshMassData(from: value, from: .gram)
        case .ounce: massViewModel.refreshMassData(from: value, from: .ounce)
        case .pound: massViewModel.refreshMassData(from: value, from: .pound)
        }
        updateMassLabels()
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


