//
//  MeasurementVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/1/22.
//

import Foundation
import UIKit

extension Double {
    func unitKilogramFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.2F", self) + " kg"
        let range = (mainString as NSString).range(of: " kg")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
    
    func unitGramFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.2F", self) + " g"
        let range = (mainString as NSString).range(of: " g")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
    
    func unitOunceFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.2F", self) + " oz"
        let range = (mainString as NSString).range(of: " oz")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
    
    func unitPoundFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.2F", self) + " lb"
        let range = (mainString as NSString).range(of: " lb")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
}

// MARK: Mass ViewModel
final class MassVM {
    var massConversion: MassType = .kilogram
    var kilogram: NSMutableAttributedString = .init(string: "")
    var gram: NSMutableAttributedString = .init(string: "")
    var ounce: NSMutableAttributedString = .init(string: "")
    var pound: NSMutableAttributedString = .init(string: "")
    
    func refreshMassData(from value: Double, from unitType: MassType) {
        switch unitType {
        case .kilogram:
            let converter = Measurement(value: value, unit: UnitMass.kilograms)
            kilogram = converter.converted(to: .kilograms).value.unitKilogramFormat()
            gram = converter.converted(to: .grams).value.unitGramFormat()
            ounce = converter.converted(to: .ounces).value.unitOunceFormat()
            pound = converter.converted(to: .pounds).value.unitPoundFormat()
        case .gram:
            let converter = Measurement(value: value, unit: UnitMass.grams)
            kilogram = converter.converted(to: .kilograms).value.unitKilogramFormat()
            gram = converter.converted(to: .grams).value.unitGramFormat()
            ounce = converter.converted(to: .ounces).value.unitOunceFormat()
            pound = converter.converted(to: .pounds).value.unitPoundFormat()
        case .ounce:
            let converter = Measurement(value: value, unit: UnitMass.ounces)
            kilogram = converter.converted(to: .kilograms).value.unitKilogramFormat()
            gram = converter.converted(to: .grams).value.unitGramFormat()
            ounce = converter.converted(to: .ounces).value.unitOunceFormat()
            pound = converter.converted(to: .pounds).value.unitPoundFormat()
        case .pound:
            let converter = Measurement(value: value, unit: UnitMass.pounds)
            kilogram = converter.converted(to: .kilograms).value.unitKilogramFormat()
            gram = converter.converted(to: .grams).value.unitGramFormat()
            ounce = converter.converted(to: .ounces).value.unitOunceFormat()
            pound = converter.converted(to: .pounds).value.unitPoundFormat()
        }
    }
}
