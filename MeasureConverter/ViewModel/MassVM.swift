//
//  MeasurementVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/1/22.
//

import Foundation

extension Double {
    func unitKilogramFormat() -> String {
        return String(format: "%.2F", self) + "kg"
    }
    
    func unitGramFormat() -> String {
        return String(format: "%.2F", self) + "g"
    }
    
    func unitOunceFormat() -> String {
        return String(format: "%.2F", self) + "oz"
    }
    
    func unitPoundFormat() -> String {
        return String(format: "%.2F", self) + "lb"
    }
}

// MARK: Mass ViewModel
final class MassVM {
    var massConversion: MassType = .kilogram
    var kilogram = ""
    var gram = ""
    var ounce = ""
    var pound = ""
    
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
