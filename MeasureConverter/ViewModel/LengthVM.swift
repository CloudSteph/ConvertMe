//
//  LengthVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/23/22.
//

import Foundation

extension Double {
    func unitLengthFormat() -> String {
        return String(format: "%.2F", self)
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
            inch = converter.converted(to: .inches).value.unitLengthFormat()
            centimeter = converter.converted(to: .centimeters).value.unitLengthFormat()
            foot = converter.converted(to: .feet).value.unitLengthFormat()
            yard = converter.converted(to: .yards).value.unitLengthFormat()
        case .centimeter:
            let converter = Measurement(value: lengthValue, unit: UnitLength.centimeters)
            inch = converter.converted(to: .inches).value.unitLengthFormat()
            centimeter = converter.converted(to: .centimeters).value.unitLengthFormat()
            foot = converter.converted(to: .feet).value.unitLengthFormat()
            yard = converter.converted(to: .yards).value.unitLengthFormat()
        case .feet:
            let converter = Measurement(value: lengthValue, unit: UnitLength.feet)
            inch = converter.converted(to: .inches).value.unitLengthFormat()
            centimeter = converter.converted(to: .centimeters).value.unitLengthFormat()
            foot = converter.converted(to: .feet).value.unitLengthFormat()
            yard = converter.converted(to: .yards).value.unitLengthFormat()
        case .yard:
            let converter = Measurement(value: lengthValue, unit: UnitLength.yards)
            inch = converter.converted(to: .inches).value.unitLengthFormat()
            centimeter = converter.converted(to: .centimeters).value.unitLengthFormat()
            foot = converter.converted(to: .feet).value.unitLengthFormat()
            yard = converter.converted(to: .yards).value.unitLengthFormat()
        }
    }
}
