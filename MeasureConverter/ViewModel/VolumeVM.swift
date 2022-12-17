//
//  VolumeVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/23/22.
//

import Foundation
import UIKit

extension Double {
    func unitCupFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.2F", self) + " cup"
        let range = (mainString as NSString).range(of: " cup")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
    
    func unitTablespoonFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.2F", self) + " tbsp"
        let range = (mainString as NSString).range(of: " tbsp")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
    
    func unitTeaspoonFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.2F", self) + " tsp"
        let range = (mainString as NSString).range(of: " tsp")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
    
    func unitFluidOunceFormat() -> NSMutableAttributedString {
        let mainString = String(format: "%.2F", self) + " fl oz"
        let range = (mainString as NSString).range(of: " fl oz")
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        return mutableAttributedString
    }
}

final class VolumeVM {
    var volumeConversion: VolumeType = .cup
    var cup: NSMutableAttributedString = .init(string: "")
    var tablespoon: NSMutableAttributedString = .init(string: "")
    var teaspoon: NSMutableAttributedString = .init(string: "")
    var fluidOunce: NSMutableAttributedString = .init(string: "")
    
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
