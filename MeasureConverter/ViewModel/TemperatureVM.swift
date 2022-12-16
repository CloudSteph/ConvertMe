//
//  TemperatureVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/26/22.
//

import Foundation

extension Double {
    func unitFarenheitFormat() -> String {
        return String(format: "%.0F", self) + "°F"
    }
    
    func unitCelsiusFormat() -> String {
        return String(format: "%.0F", self) + "°C"
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
            celsius = converter.converted(to: .celsius).value.unitFarenheitFormat()
            fahrenheit = converter.converted(to: .fahrenheit).value.unitCelsiusFormat()
        case .fahrenheit:
            let converter = Measurement(value: tempValue, unit: UnitTemperature.fahrenheit)
            celsius = converter.converted(to: .celsius).value.unitFarenheitFormat()
            fahrenheit = converter.converted(to: .fahrenheit).value.unitCelsiusFormat()
        }
    }
}
