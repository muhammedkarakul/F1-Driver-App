//
//  DetailView.swift
//  ios-template
//
//  Created by Muhammed Karakul on 28.07.2021.
//

import UIKit

final class DetailView: BaseView {
    // MARK: - Properties
    var teamInfo: String? {
        didSet {
            teamInfoLabel.text = "Takım: \(teamInfo ?? "N/A")"
        }
    }

    var age: Int = .zero {
        didSet {
            ageLabel.text = "Yaş: \(age)"
        }
    }

    // MARK: - UI
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var teamInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32.0)
        label.textAlignment = .center
        return label
    }()
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    // MARK: - Setup
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
    }

    override func prepareLayout() {
        super.prepareLayout()

        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        addSubview(teamInfoLabel)
        teamInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(16.0)
            make.top.equalTo(imageView.snp.bottom).offset(16.0)
            make.trailing.equalTo(-16.0)
        }

        addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.leading.equalTo(16.0)
            make.top.equalTo(teamInfoLabel.snp.bottom).offset(8.0)
            make.trailing.equalTo(-16.0)
            make.bottom.equalTo(-64.0)
        }
    }
}
