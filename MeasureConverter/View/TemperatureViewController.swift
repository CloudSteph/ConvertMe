//
//  TemperatureViewController.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/2/22.
//

import Foundation
import UIKit

extension Double {
    func unitTempFormat() -> String {
        return String(format: "%.0F", self)
    }
}

final class TemperatureViewController: UIViewController, Storyboardable {
    @IBOutlet private(set) weak var inputTempTextField: UITextField!
    @IBOutlet private(set) weak var celsiusLabel: UILabel!
    @IBOutlet private(set) weak var fahrenheitLabel: UILabel!
    
    private var tempConversion: TempType = .celsius
    
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
        guard let unwrappedInputTemp = inputTempTextField.text,
              let tempValue = Double(unwrappedInputTemp) else {return}
        
        switch tempConversion {
        case .celsius: startTempConversions(from: tempValue, from: .celsius)
        case .fahrenheit: startTempConversions(from: tempValue, from: .fahrenheit)
        }
    }
    
    @IBAction func tempTypeSelected(sender: UISegmentedControl) {
        guard let tempType = TempType(rawValue: sender.selectedSegmentIndex) else {
            self.tempConversion = .celsius
            return
        }
        self.tempConversion = tempType
        
        guard let unwrappedInputTemp = inputTempTextField.text,
              let tempValue = Double(unwrappedInputTemp) else {return}
        
        switch tempConversion {
        case .celsius: startTempConversions(from: tempValue, from: .celsius)
        case .fahrenheit: startTempConversions(from: tempValue, from: .fahrenheit)
        }
    }
}

// MARK: - Temp Helper Method
extension TemperatureViewController {
    func startTempConversions(from tempValue: Double, from tempType: TempType) {
        switch tempType {
        case .celsius:
            let tempConverter = Measurement(value: tempValue, unit: UnitTemperature.celsius)
            self.celsiusLabel.text = tempConverter.converted(to: UnitTemperature.celsius).value.unitTempFormat()
            self.fahrenheitLabel.text = tempConverter.converted(to: UnitTemperature.fahrenheit).value.unitTempFormat()
        case .fahrenheit:
            let tempConverter = Measurement(value: tempValue, unit: UnitTemperature.fahrenheit)
            self.celsiusLabel.text = tempConverter.converted(to: UnitTemperature.celsius).value.unitTempFormat()
            self.fahrenheitLabel.text = tempConverter.converted(to: UnitTemperature.fahrenheit).value.unitTempFormat()
        }
    }
}



/*
Fahrenheit to Celsius
 32f = 0C
 Formula:
 (32F-32)*5/9 = 0C
*/
