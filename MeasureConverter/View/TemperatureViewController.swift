//
//  TemperatureViewController.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/2/22.
//

import Foundation
import UIKit

final class TemperatureViewController: UIViewController, Storyboardable {
    @IBOutlet private(set) weak var inputTempTextField: UITextField!
    @IBOutlet private(set) weak var celsiusLabel: UILabel!
    @IBOutlet private(set) weak var fahrenheitLabel: UILabel!
    
    private var tempViewModel: TemperatureVM = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTempTextField.keyboardType = UIKeyboardType.decimalPad
        
        let tempToolBar = UIToolbar()
        tempToolBar.sizeToFit()
        let tempFlexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let tempBarBtnDone = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(donePerformed(sender:)))
        
        tempToolBar.items = [tempFlexibleSpace, tempBarBtnDone]
        self.inputTempTextField.inputAccessoryView = tempToolBar
    }
}

// MARK: - Actions
extension TemperatureViewController {
    @objc private func donePerformed(sender: Any) {
        self.inputTempTextField.resignFirstResponder()
        guard let unwrappedInputTemp = inputTempTextField.text,
              let tempValue = Double(unwrappedInputTemp) else {return}
        
        switch tempViewModel.tempConversion {
        case .celsius: tempViewModel.refreshTempData(from: tempValue, from: .celsius)
        case .fahrenheit: tempViewModel.refreshTempData(from: tempValue, from: .fahrenheit)
        }
        updateTempLabels()
    }
    
    @IBAction func tempTypeSelected(sender: UISegmentedControl) {
        guard let tempType = TempType(rawValue: sender.selectedSegmentIndex) else {
            self.tempViewModel.tempConversion = .celsius
            return
        }
        self.tempViewModel.tempConversion = tempType
        
        guard let unwrappedInputTemp = inputTempTextField.text,
              let tempValue = Double(unwrappedInputTemp) else {return}
        
        switch tempViewModel.tempConversion {
        case .celsius: tempViewModel.refreshTempData(from: tempValue, from: .celsius)
        case .fahrenheit: tempViewModel.refreshTempData(from: tempValue, from: .fahrenheit)
        }
        updateTempLabels()
    }
}

// MARK: - Temp Helper Method
extension TemperatureViewController {
    func updateTempLabels() {
        celsiusLabel.text = tempViewModel.celsius
        fahrenheitLabel.text = tempViewModel.fahrenheit
    }
}



/*
Fahrenheit to Celsius
 32f = 0C
 Formula:
 (32F-32)*5/9 = 0C
*/
