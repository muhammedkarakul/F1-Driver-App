//
//  ProgressHUDPresentable.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import MBProgressHUD

protocol ProgressHUDPresentable {
    func showProgressHUD()
    func hideProgressHUD()
}

extension ProgressHUDPresentable {
    private var progressHudTag: Int {
        111
    }

    private var activityIndicatorView: UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.tag = progressHudTag
        return activityIndicatorView
    }

    func showProgressHUD() {
        if let window = UIApplication.shared.keyWindow {
            let activityIndicatorView = activityIndicatorView
            window.addSubview(activityIndicatorView)
            activityIndicatorView.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.height.equalTo(75.0)
            }
            activityIndicatorView.startAnimating()
        }
    }

    func hideProgressHUD() {
        if let window = UIApplication.shared.keyWindow {
            for view in window.subviews where view.tag == progressHudTag {
                view.removeFromSuperview()
                activityIndicatorView.stopAnimating()
                break
            }
        }
    }
}
