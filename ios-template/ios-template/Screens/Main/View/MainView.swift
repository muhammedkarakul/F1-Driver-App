//
//  MainView.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import UIKit

final class MainView: BaseView {

    // MARK: - UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    // MARK: - Setup
    override func linkInteractor() {
        super.linkInteractor()
        tableView.register(DriverTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
    }

    override func prepareLayout() {
        super.prepareLayout()
        setupTableViewLayout()
    }

    // MARK: - Methods
    private func setupTableViewLayout() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setTableViewDelegate(_ delegate: UITableViewDelegate, andDataSource dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }

    func refresh() {
        tableView.reloadData()
    }
}
