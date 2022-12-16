//
//  HomeViewController.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/1/22.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController, Storyboardable {
    
    @IBOutlet private(set) weak var massBtn: UIButton!
    @IBOutlet private(set) weak var lengthBtn: UIButton!
    @IBOutlet private(set) weak var volumeBtn: UIButton!
    @IBOutlet private(set) weak var tempBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        massBtnStyle()
        lengthBtnStyle()
        volumeBtnStyle()
        tempBtnStyle()
        
        navigationController?.navigationBar.tintColor = .black
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

// MARK: - Setup Button Styles
extension HomeViewController {
    func massBtnStyle() {
        massBtn.layer.shadowOffset = CGSize(width: 0, height: 1)
        massBtn.layer.shadowColor = UIColor.darkGray.cgColor
        massBtn.layer.shadowOpacity = 1
        massBtn.layer.shadowRadius = 1
    }
    
    func lengthBtnStyle() {
        lengthBtn.layer.shadowOffset = CGSize(width: 0, height: 1)
        lengthBtn.layer.shadowColor = UIColor.darkGray.cgColor
        lengthBtn.layer.shadowOpacity = 1
        lengthBtn.layer.shadowRadius = 1
    }
    
    func volumeBtnStyle() {
        volumeBtn.layer.shadowOffset = CGSize(width: 0, height: 1)
        volumeBtn.layer.shadowColor = UIColor.darkGray.cgColor
        volumeBtn.layer.shadowOpacity = 1
        volumeBtn.layer.shadowRadius = 1
    }
    
    func tempBtnStyle() {
        tempBtn.layer.shadowOffset = CGSize(width: 0, height: 1)
        tempBtn.layer.shadowColor = UIColor.darkGray.cgColor
        tempBtn.layer.shadowOpacity = 1
        tempBtn.layer.shadowRadius = 1
    }
}
