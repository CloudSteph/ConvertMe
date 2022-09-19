//
//  Storyboardable.swift
//  MeasureConverter
//
//  Created by Stephanie Liew on 9/6/22.
//

import Foundation
import UIKit

protocol Storyboardable {
    static func instantiate() -> Self
    
    // MARK: - Properties
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var storyboardIdentifier: String { get }
}

extension Storyboardable where Self: UIViewController {
    static var storyboardName: String {
        return "Main"
    }
    
    static var storyboardBundle: Bundle {
        return .main
    }
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: storyboardBundle).instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to Instantiate ViewController With Storyboard Identifier \(storyboardIdentifier)")
        }
        return viewController
    }
}
