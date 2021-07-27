//
//  DriverTableViewCell.swift
//  ios-template
//
//  Created by Muhammed Karakul on 28.07.2021.
//

import UIKit

protocol DriverTableViewCellDelegate: AnyObject {
    func driverTableViewCell(_ cell: DriverTableViewCell, didTapAddFavoriteButton button: UIButton)
}

final class DriverTableViewCell: BaseTableViewCell {
    // MARK: - Properties
    weak var delegate: DriverTableViewCellDelegate?

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    var point: Int = .zero {
        didSet {
            pointLabel.text = String(point)
        }
    }

    var isFavorite: Bool = false {
        didSet {
            if isFavorite {
                addFavoriteButton.tintColor = .systemYellow
            } else {
                addFavoriteButton.tintColor = .lightGray
            }
        }
    }

    // MARK: - UI
    private lazy var titleLabel = UILabel()

    private lazy var pointLabel = UILabel()

    private lazy var addFavoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "star")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        return button
    }()

    // MARK: Setup
    override func linkInteractor() {
        super.linkInteractor()
        addFavoriteButton.addTarget(self, action: #selector(didTapAddFavoriteButton(_:)), for: .touchUpInside)
    }

    override func prepareLayout() {
        super.prepareLayout()

        setupAddFavoriteButtonLayout()
        setupTitleLabelLayout()
        setupPointLabelLayout()
    }

    // MARK: Methods
    private func setupAddFavoriteButtonLayout() {
        contentView.addSubview(addFavoriteButton)
        addFavoriteButton.snp.makeConstraints { make in
            make.top.equalTo(8.0)
            make.trailing.equalTo(-16.0)
            make.bottom.equalTo(-8.0)
            make.width.equalTo(32.0)
        }
    }

    private func setupTitleLabelLayout() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(16.0)
            make.top.equalTo(8.0)
            make.trailing.equalTo(addFavoriteButton.snp.leading).offset(8.0)
            make.height.equalTo(24.0)
        }
    }

    private func setupPointLabelLayout() {
        contentView.addSubview(pointLabel)
        pointLabel.snp.makeConstraints { make in
            make.leading.equalTo(16.0)
            make.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            make.trailing.equalTo(addFavoriteButton.snp.leading).offset(-8.0)
            make.bottom.equalTo(-8.0)
        }
    }
}

// MARK: - Actions
extension DriverTableViewCell {
    @objc
    private func didTapAddFavoriteButton(_ sender: UIButton) {
        delegate?.driverTableViewCell(self, didTapAddFavoriteButton: sender)
    }
}
