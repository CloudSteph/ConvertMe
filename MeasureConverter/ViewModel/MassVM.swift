//
//  MeasurementVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/1/22.
//

import Foundation

extension Double {
    func unitMassFormat() -> String {
        return String(format: "%.2F", self)
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
            kilogram = converter.converted(to: .kilograms).value.unitMassFormat()
            gram = converter.converted(to: .grams).value.unitMassFormat()
            ounce = converter.converted(to: .ounces).value.unitMassFormat()
            pound = converter.converted(to: .pounds).value.unitMassFormat()
        case .gram:
            let converter = Measurement(value: value, unit: UnitMass.grams)
            kilogram = converter.converted(to: .kilograms).value.unitMassFormat()
            gram = converter.converted(to: .grams).value.unitMassFormat()
            ounce = converter.converted(to: .ounces).value.unitMassFormat()
            pound = converter.converted(to: .pounds).value.unitMassFormat()
        case .ounce:
            let converter = Measurement(value: value, unit: UnitMass.ounces)
            kilogram = converter.converted(to: .kilograms).value.unitMassFormat()
            gram = converter.converted(to: .grams).value.unitMassFormat()
            ounce = converter.converted(to: .ounces).value.unitMassFormat()
            pound = converter.converted(to: .pounds).value.unitMassFormat()
        case .pound:
            let converter = Measurement(value: value, unit: UnitMass.pounds)
            kilogram = converter.converted(to: .kilograms).value.unitMassFormat()
            gram = converter.converted(to: .grams).value.unitMassFormat()
            ounce = converter.converted(to: .ounces).value.unitMassFormat()
            pound = converter.converted(to: .pounds).value.unitMassFormat()
        }
    }
}
