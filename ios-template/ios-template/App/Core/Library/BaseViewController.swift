//
//  BaseViewController.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import UIKit

class BaseViewController<T: BaseView>: LayoutableViewController, AlertPresentable {
    // MARK: - Properties
    typealias ViewType = T

    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        linkInteractor()
        configureAppearance()
        prepareLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = ViewType.create()
    }

    // MARK: - Methods
    func linkInteractor() {}

    func configureAppearance() {}

    func prepareLayout() {}
}
