//
//  BaseTableViewCell.swift
//  ios-template
//
//  Created by Muhammed Karakul on 28.07.2021.
//

import UIKit

class BaseTableViewCell: UITableViewCell, Layoutable {
    // MARK: - Init
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        linkInteractor()
        configureAppearance()
        prepareLayout()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    public func linkInteractor() {}
    public func configureAppearance() {}
    public func prepareLayout() {}
}
