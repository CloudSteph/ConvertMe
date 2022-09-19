//
//  HomeViewController.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/1/22.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController, Storyboardable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IBActions
extension HomeViewController {
    @IBAction func didPressMass(sender: UIButton) {
        let massVC: MassViewController = .instantiate()
        navigationController?.pushViewController(massVC, animated: true)
    }
    
    @IBAction func didPressLength(sender: UIButton) {
        let lengthVC: LengthViewController = .instantiate()
        navigationController?.pushViewController(lengthVC, animated: true)
    }
    
    @IBAction func didPressVolume(sender: UIButton) {
        let volumeVC: VolumeViewController = .instantiate()
        navigationController?.pushViewController(volumeVC, animated: true)
    }
    
    @IBAction func didPressTemp(sender: UIButton) {
        let tempVC: TemperatureViewController = .instantiate()
        navigationController?.pushViewController(tempVC, animated: true)
    }
}
