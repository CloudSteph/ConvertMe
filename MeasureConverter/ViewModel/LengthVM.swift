//
//  LengthVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/23/22.
//

import Foundation
import UIKit

extension Double {
    func unitInchFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.2F", self) + " in"
        let range = (mainString as NSString).range(of: " in")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
    
        return mutableAttributedString
    }
    
    func unitCentimeterFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.2F", self) + " cm"
        let range = (mainString as NSString).range(of: " cm")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
    
    func unitFootFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.2F", self) + " ft"
        let range = (mainString as NSString).range(of: " ft")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
    
    func unitYardFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.2F", self) + " yd"
        let range = (mainString as NSString).range(of: " yd")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
}

final class LengthVM {
    var lengthConversion: LengthType = .inch
    var inch: NSMutableAttributedString = .init(string: "")
    var centimeter: NSMutableAttributedString = .init(string: "")
    var foot: NSMutableAttributedString = .init(string: "")
    var yard: NSMutableAttributedString = .init(string: "")
    
    func refreshLengthData(from lengthValue: Double, from lengthType: LengthType) {
        switch lengthType {
        case .inch:
            let converter = Measurement(value: lengthValue, unit: UnitLength.inches)
            inch = converter.converted(to: .inches).value.unitInchFormat()
            centimeter = converter.converted(to: .centimeters).value.unitCentimeterFormat()
            foot = converter.converted(to: .feet).value.unitFootFormat()
            yard = converter.converted(to: .yards).value.unitYardFormat()
        case .centimeter:
            let converter = Measurement(value: lengthValue, unit: UnitLength.centimeters)
            inch = converter.converted(to: .inches).value.unitInchFormat()
            centimeter = converter.converted(to: .centimeters).value.unitCentimeterFormat()
            foot = converter.converted(to: .feet).value.unitFootFormat()
            yard = converter.converted(to: .yards).value.unitYardFormat()
        case .feet:
            let converter = Measurement(value: lengthValue, unit: UnitLength.feet)
            inch = converter.converted(to: .inches).value.unitInchFormat()
            centimeter = converter.converted(to: .centimeters).value.unitCentimeterFormat()
            foot = converter.converted(to: .feet).value.unitFootFormat()
            yard = converter.converted(to: .yards).value.unitYardFormat()
        case .yard:
            let converter = Measurement(value: lengthValue, unit: UnitLength.yards)
            inch = converter.converted(to: .inches).value.unitInchFormat()
            centimeter = converter.converted(to: .centimeters).value.unitCentimeterFormat()
            foot = converter.converted(to: .feet).value.unitFootFormat()
            yard = converter.converted(to: .yards).value.unitYardFormat()
        }
    }
}
