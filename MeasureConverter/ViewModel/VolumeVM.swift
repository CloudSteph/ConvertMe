//
//  VolumeVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/23/22.
//

import Foundation

extension Double {
    func unitCupFormat() -> String {
        return String(format: "%.2F", self) + " cup"
    }
    
    func unitTablespoonFormat() -> String {
        return String(format: "%.2F", self) + " tbsp"
    }
    
    func unitTeaspoonFormat() -> String {
        return String(format: "%.2F", self) + " tsp"
    }
    
    func unitFluidOunceFormat() -> String {
        return String(format: "%.2F", self) + " fl oz"
    }
}

final class VolumeVM {
    var volumeConversion: VolumeType = .cup
    var cup = ""
    var tablespoon = ""
    var teaspoon = ""
    var fluidOunce = ""
    
    func refreshVolumeData(from volumeValue: Double, from volumeType: VolumeType) {
        switch volumeType {
        case .cup:
            let converter = Measurement(value: volumeValue, unit: UnitVolume.cups)
            cup = converter.converted(to: .cups).value.unitCupFormat()
            tablespoon = converter.converted(to: .tablespoons).value.unitTablespoonFormat()
            teaspoon = converter.converted(to: .teaspoons).value.unitTeaspoonFormat()
            fluidOunce = converter.converted(to: .fluidOunces).value.unitFluidOunceFormat()
        case .tablespoon:
            let converter = Measurement(value: volumeValue, unit: UnitVolume.tablespoons)
            cup = converter.converted(to: .cups).value.unitCupFormat()
            tablespoon = converter.converted(to: .tablespoons).value.unitTablespoonFormat()
            teaspoon = converter.converted(to: .teaspoons).value.unitTeaspoonFormat()
            fluidOunce = converter.converted(to: .fluidOunces).value.unitFluidOunceFormat()
        case .teaspoon:
            let converter = Measurement(value: volumeValue, unit: UnitVolume.teaspoons)
            cup = converter.converted(to: .cups).value.unitCupFormat()
            tablespoon = converter.converted(to: .tablespoons).value.unitTablespoonFormat()
            teaspoon = converter.converted(to: .teaspoons).value.unitTeaspoonFormat()
            fluidOunce = converter.converted(to: .fluidOunces).value.unitFluidOunceFormat()
        case .fluidOunce:
            let converter = Measurement(value: volumeValue, unit: UnitVolume.fluidOunces)
            cup = converter.converted(to: .cups).value.unitCupFormat()
            tablespoon = converter.converted(to: .tablespoons).value.unitTablespoonFormat()
            teaspoon = converter.converted(to: .teaspoons).value.unitTeaspoonFormat()
            fluidOunce = converter.converted(to: .fluidOunces).value.unitFluidOunceFormat()
        }
    }
}
