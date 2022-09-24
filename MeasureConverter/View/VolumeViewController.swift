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
   
    private var volumeViewModel: VolumeVM = .init()
    
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
        self.inputVolumeTextField.resignFirstResponder()
        guard let unwrappedInputVolume = inputVolumeTextField.text,
        let volumeValue = Double(unwrappedInputVolume) else {return}
        
        switch volumeViewModel.volumeConversion {
        case .cup: volumeViewModel.refreshVolumeData(from: volumeValue, from: .cup)
        case .tablespoon: volumeViewModel.refreshVolumeData(from: volumeValue, from: .tablespoon)
        case .teaspoon: volumeViewModel.refreshVolumeData(from: volumeValue, from: .teaspoon)
        case .fluidOunce: volumeViewModel.refreshVolumeData(from: volumeValue, from: .fluidOunce)
        }
        updateVolumeLabels()
    }
    
    @IBAction func inputVolumeTypeSelected(sender: UISegmentedControl) {
        guard let volumeType = VolumeType(rawValue: sender.selectedSegmentIndex) else {
            self.volumeViewModel.volumeConversion = .cup
            return
        }
        self.volumeViewModel.volumeConversion = volumeType
        
        guard let unwrapInputVolume = inputVolumeTextField.text,
        let volumeValue = Double(unwrapInputVolume) else {return}
        
        switch volumeViewModel.volumeConversion {
        case .cup: volumeViewModel.refreshVolumeData(from: volumeValue, from: .cup)
        case .tablespoon: volumeViewModel.refreshVolumeData(from: volumeValue, from: .tablespoon)
        case .teaspoon: volumeViewModel.refreshVolumeData(from: volumeValue, from: .teaspoon)
        case .fluidOunce: volumeViewModel.refreshVolumeData(from: volumeValue, from: .fluidOunce)
        }
        updateVolumeLabels()
    }
}

// MARK: Volume Helper Methods
extension VolumeViewController {
    func updateVolumeLabels() {
        cupLabel.text = volumeViewModel.cup
        tablespoonLabel.text = volumeViewModel.tablespoon
        teaspoonLabel.text = volumeViewModel.teaspoon
        fluidOunceLabel.text = volumeViewModel.fluidOunce
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
