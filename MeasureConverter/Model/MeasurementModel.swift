//
//  MeasurementModel.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/1/22.
//

import Foundation

// MARK: - Model(Blueprint)
enum MassType: Int, Codable {
    case kilogram
    case gram
    case ounce
    case pound
}

enum LengthType: Int, Codable {
    case inch
    case centimeter
    case feet
    case yard
}

enum VolumeType: Int, Codable {
    case cup
    case tablespoon
    case teaspoon
    case fluidOunce
}

enum TempType: Int, Codable {
    case celsius
    case fahrenheit
}

struct UnitType: Codable {
    var mass: MassType
    var length: LengthType
    var volume: VolumeType
    var temp: TempType
}
