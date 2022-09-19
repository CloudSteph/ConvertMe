//
//  VolumeViewController.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/2/22.
//

import Foundation
import UIKit

final class VolumeViewController: UIViewController, Storyboardable {
    @IBOutlet private(set) weak var inputVolumeTextField: UITextField!
    @IBOutlet private(set) weak var cupLabel: UILabel!
    @IBOutlet private(set) weak var tablespoonLabel: UILabel!
    @IBOutlet private(set) weak var teaspoonLabel: UILabel!
    @IBOutlet private(set) weak var fluidOunceLabel: UILabel!
   
    
    private var volumeConversion: VolumeType = .cup
    private var viewModel: MeasurementVM = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputVolumeTextField.keyboardType = UIKeyboardType.decimalPad
        
        let volumeToolBar = UIToolbar.init()
        volumeToolBar.sizeToFit()
        let volumeFlexibleSpace = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let volumeBarBtnItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneSelected(sender:)))
        
        volumeToolBar.items = [volumeFlexibleSpace, volumeBarBtnItem]
        self.inputVolumeTextField.inputAccessoryView = volumeToolBar
    }
}

// MARK: - Actions
extension VolumeViewController {
    @objc private func doneSelected(sender: Any) {
        guard let unwrappedInputVolume = inputVolumeTextField.text,
        let volumeValue = Double(unwrappedInputVolume) else {return}
        
        switch volumeConversion {
        case .cup: startVolumeConversions(from: volumeValue, from: .cup)
        case .tablespoon: startVolumeConversions(from: volumeValue, from: .tablespoon)
        case .teaspoon: startVolumeConversions(from: volumeValue, from: .teaspoon)
        case .fluidOunce: startVolumeConversions(from: volumeValue, from: .fluidOunce)
        }
    }
    
    @IBAction func inputVolumeTypeSelected(sender: UISegmentedControl) {
        guard let volumeType = VolumeType(rawValue: sender.selectedSegmentIndex) else {
            self.volumeConversion = .cup
            return
        }
        self.volumeConversion = volumeType
        
        guard let unwrapInputVolume = inputVolumeTextField.text,
        let volumeValue = Double(unwrapInputVolume) else {return}
        
        switch volumeConversion {
        case .cup: startVolumeConversions(from: volumeValue, from: .cup)
        case .tablespoon: startVolumeConversions(from: volumeValue, from: .tablespoon)
        case .teaspoon: startVolumeConversions(from: volumeValue, from: .teaspoon)
        case .fluidOunce: startVolumeConversions(from: volumeValue, from: .fluidOunce)
        }
    }
}

// MARK: Volume Helper Methods
extension VolumeViewController {
    func startVolumeConversions(from volumeValue: Double, from volumeType: VolumeType) {
        switch volumeType {
        case .cup:
            let volumeConverter = Measurement(value: volumeValue, unit: UnitVolume.cups)
            self.cupLabel.text = volumeConverter.converted(to: UnitVolume.cups).value.unitFormat()
            self.tablespoonLabel.text = volumeConverter.converted(to: UnitVolume.tablespoons).value.unitFormat()
            self.teaspoonLabel.text = volumeConverter.converted(to: UnitVolume.teaspoons).value.unitFormat()
            self.fluidOunceLabel.text = volumeConverter.converted(to: UnitVolume.fluidOunces).value.unitFormat()
        case .tablespoon:
            let volumeConverter = Measurement(value: volumeValue, unit: UnitVolume.tablespoons)
            self.cupLabel.text = volumeConverter.converted(to: UnitVolume.cups).value.unitFormat()
            self.tablespoonLabel.text = volumeConverter.converted(to: UnitVolume.tablespoons).value.unitFormat()
            self.teaspoonLabel.text = volumeConverter.converted(to: UnitVolume.teaspoons).value.unitFormat()
            self.fluidOunceLabel.text = volumeConverter.converted(to: UnitVolume.fluidOunces).value.unitFormat()
        case .teaspoon:
            let volumeConverter = Measurement(value: volumeValue, unit: UnitVolume.teaspoons)
            self.cupLabel.text = volumeConverter.converted(to: UnitVolume.cups).value.unitFormat()
            self.tablespoonLabel.text = volumeConverter.converted(to: UnitVolume.tablespoons).value.unitFormat()
            self.teaspoonLabel.text = volumeConverter.converted(to: UnitVolume.teaspoons).value.unitFormat()
            self.fluidOunceLabel.text = volumeConverter.converted(to: UnitVolume.fluidOunces).value.unitFormat()
        case .fluidOunce:
            let volumeConverter = Measurement(value: volumeValue, unit: UnitVolume.fluidOunces)
            self.cupLabel.text = volumeConverter.converted(to: UnitVolume.cups).value.unitFormat()
            self.tablespoonLabel.text = volumeConverter.converted(to: UnitVolume.tablespoons).value.unitFormat()
            self.teaspoonLabel.text = volumeConverter.converted(to: UnitVolume.teaspoons).value.unitFormat()
            self.fluidOunceLabel.text = volumeConverter.converted(to: UnitVolume.fluidOunces).value.unitFormat()
        }
    }
}

/*
cup to cup

cup to tablespoon
1cup to 16.2307tbs
Multiply by 16.231
 
cup to teaspoon
1cup to 48.6922tsp
Multiply by 48.692
 
cup to ounce
1cup to 8.11537
Multiply by 8.115
*/
