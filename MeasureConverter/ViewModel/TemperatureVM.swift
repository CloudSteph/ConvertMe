//
//  TemperatureVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/26/22.
//

import Foundation

extension Double {
    func unitTempFormat() -> String {
        return String(format: "%.0F", self)
    }
}

final class TemperatureVM {
    var tempConversion: TempType = .celsius
    var celsius = ""
    var fahrenheit = ""
    
    func refreshTempData(from tempValue: Double, from tempType: TempType) {
        switch tempType {
        case .celsius:
            let converter = Measurement(value: tempValue, unit: UnitTemperature.celsius)
            celsius = converter.converted(to: .celsius).value.unitTempFormat()
            fahrenheit = converter.converted(to: .fahrenheit).value.unitTempFormat()
        case .fahrenheit:
            let converter = Measurement(value: tempValue, unit: UnitTemperature.fahrenheit)
            celsius = converter.converted(to: .celsius).value.unitTempFormat()
            fahrenheit = converter.converted(to: .fahrenheit).value.unitTempFormat()
        }
    }
}
