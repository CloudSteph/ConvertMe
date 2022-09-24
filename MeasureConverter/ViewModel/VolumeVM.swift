//
//  VolumeVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/23/22.
//

import Foundation

extension Double {
    func unitVolumeFormat() -> String {
        return String(format: "%.2F", self)
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
            cup = converter.converted(to: .cups).value.unitVolumeFormat()
            tablespoon = converter.converted(to: .tablespoons).value.unitVolumeFormat()
            teaspoon = converter.converted(to: .teaspoons).value.unitVolumeFormat()
            fluidOunce = converter.converted(to: .fluidOunces).value.unitVolumeFormat()
        case .tablespoon:
            let converter = Measurement(value: volumeValue, unit: UnitVolume.tablespoons)
            cup = converter.converted(to: .cups).value.unitVolumeFormat()
            tablespoon = converter.converted(to: .tablespoons).value.unitVolumeFormat()
            teaspoon = converter.converted(to: .teaspoons).value.unitVolumeFormat()
            fluidOunce = converter.converted(to: .fluidOunces).value.unitVolumeFormat()
        case .teaspoon:
            let converter = Measurement(value: volumeValue, unit: UnitVolume.teaspoons)
            cup = converter.converted(to: .cups).value.unitVolumeFormat()
            tablespoon = converter.converted(to: .tablespoons).value.unitVolumeFormat()
            teaspoon = converter.converted(to: .teaspoons).value.unitVolumeFormat()
            fluidOunce = converter.converted(to: .fluidOunces).value.unitVolumeFormat()
        case .fluidOunce:
            let converter = Measurement(value: volumeValue, unit: UnitVolume.fluidOunces)
            cup = converter.converted(to: .cups).value.unitVolumeFormat()
            tablespoon = converter.converted(to: .tablespoons).value.unitVolumeFormat()
            teaspoon = converter.converted(to: .teaspoons).value.unitVolumeFormat()
            fluidOunce = converter.converted(to: .fluidOunces).value.unitVolumeFormat()
        }
    }
}