//
//  LengthVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/23/22.
//

import Foundation

extension Double {
    func unitInchFormat() -> String {
        return String(format: "%.2F", self) + " in"
    }
    
    func unitCentimeterFormat() -> String {
        return String(format: "%.2F", self) + " cm"
    }
    
    func unitFootFormat() -> String {
        return String(format: "%.2F", self) + " ft"
    }
    
    func unitYardFormat() -> String {
        return String(format: "%.2F", self) + " yd"
    }
}

final class LengthVM {
    var lengthConversion: LengthType = .inch
    var inch = ""
    var centimeter = ""
    var foot = ""
    var yard = ""
    
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
