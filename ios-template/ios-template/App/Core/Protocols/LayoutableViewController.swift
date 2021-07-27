//
//  LayoutableViewController.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import UIKit

typealias LayoutableViewController = UIViewController & Layouting & Layoutable

public protocol Layouting: AnyObject {

    associatedtype ViewType: UIView & Layoutable

    var baseView: ViewType { get }
}

public extension Layouting where Self: UIViewController {

    var baseView: ViewType {
        guard let aView = view as? ViewType else {
            fatalError("view property has not been inialized yet, or not initialized as \(ViewType.self).")
        }
        return aView
    }
}
