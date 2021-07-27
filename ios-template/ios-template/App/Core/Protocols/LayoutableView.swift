//
//  LayoutableView.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import UIKit

typealias LayoutableView = UIView & Layoutable

public protocol Layoutable: AnyObject {
    func linkInteractor()
    func configureAppearance()
    func prepareLayout()
}

extension Layoutable where Self: BaseView {
    static func create() -> Self {
        let view = Self()
        return view
    }
}
