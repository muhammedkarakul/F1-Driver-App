//
//  BaseView.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import UIKit

class BaseView: LayoutableView {
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        linkInteractor()
        configureAppearance()
        prepareLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    func linkInteractor() {}
    func configureAppearance() {}
    func prepareLayout() {}
}
