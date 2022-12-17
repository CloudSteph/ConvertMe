//
//  TemperatureVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/26/22.
//

import Foundation
import UIKit

extension Double {
    func unitFarenheitFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.0F", self) + "°F"
        let range = (mainString as NSString).range(of: "°F")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
    
    func unitCelsiusFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.0F", self) + "°C"
        let range = (mainString as NSString).range(of: "°C")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
}

final class TemperatureVM {
    var tempConversion: TempType = .celsius
    var celsius: NSMutableAttributedString = .init(string: "")
    var fahrenheit: NSMutableAttributedString = .init(string: "")
    
    func refreshTempData(from tempValue: Double, from tempType: TempType) {
        switch tempType {
        case .celsius:
            let converter = Measurement(value: tempValue, unit: UnitTemperature.celsius)
            celsius = converter.converted(to: .celsius).value.unitFarenheitFormat()
            fahrenheit = converter.converted(to: .fahrenheit).value.unitCelsiusFormat()
        case .fahrenheit:
            let converter = Measurement(value: tempValue, unit: UnitTemperature.fahrenheit)
            celsius = converter.converted(to: .celsius).value.unitFarenheitFormat()
            fahrenheit = converter.converted(to: .fahrenheit).value.unitCelsiusFormat()
        }
    }
}
