//
//  MeasurementVM.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/1/22.
//

import Foundation

extension Double {
    func unitFormat() -> String {
        return String(format: "%.2F", self)
    }
}

final class MeasurementVM {
    
    private(set) var unitTypeViewModel: [UnitTypeViewModel]
    
    init() {
        self.unitTypeViewModel = [UnitTypeViewModel]()
    }
}

struct UnitTypeViewModel {
    let unitType: UnitType
}

//extension UnitTypeViewModel {
//    var mass: String {
//        return self.unitType.
//    }
//}
