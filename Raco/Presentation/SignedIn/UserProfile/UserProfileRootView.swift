//
//  UserProfileRootView.swift
//  Raco
//
//  Created by alvaro on 13/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

class UserProfileRootView: NiblessView {

    private var hierarchyNotReady = true

    // MARK: - Views
    private let userProfileImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.backgroundColor = .systemGray2

        return imageView
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()

        let font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        label.text = "Álvaro Girona Arias"
        label.textAlignment = .center
        label.font = font

        return label
    }()

    // MARK: - Rendering
    func renderUserProfile() {

    }

    // MARK: - Initialization
    override init (
        frame: CGRect = .zero
    ) {
        super.init(frame: frame)
    }


    override func didMoveToWindow() {
        guard hierarchyNotReady else {
            return
        }

        hierarchyNotReady = false

        backgroundColor = UIColor.systemGroupedBackground

        makeHierarchy()
        activateConstraints()
        roundUserProfile()
    }

    private func roundUserProfile() {
        userProfileImageView.layoutIfNeeded()
        userProfileImageView.layer.cornerRadius = userProfileImageView.bounds.height/2
        userProfileImageView.layer.masksToBounds = true
    }

    // MARK: Hierarchy
    private func makeHierarchy() {
        addSubview(userProfileImageView)
        addSubview(userNameLabel)
    }

    // MARK: Constraints
    private func activateConstraints() {
        activateUserProfileImageViewConstraints()
        activateUserNameLabelConstraints()
    }

    private func activateUserProfileImageViewConstraints() {
        userProfileImageView.translatesAutoresizingMaskIntoConstraints = false

        let width = userProfileImageView.widthAnchor
            .constraint(equalToConstant: 90)
        let height = userProfileImageView.heightAnchor
            .constraint(equalToConstant: 90)
        let centerY = userProfileImageView.centerXAnchor
            .constraint(equalTo: centerXAnchor)
        let top = userProfileImageView.topAnchor
            .constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30)

        NSLayoutConstraint.activate([width, height, centerY, top])
    }

    private func activateUserNameLabelConstraints() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false

        let leading = userNameLabel.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: 16)
        let trailing = userNameLabel.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -16)
        let top = userNameLabel.topAnchor
            .constraint(equalTo: userProfileImageView.bottomAnchor, constant: 20)

        NSLayoutConstraint.activate([leading, trailing, top])
    }
}

#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct UserProfileRootView_Preview: PreviewProvider {

    static var previews: some View {
        UIViewPreview {
            UserProfileRootView()
        }.previewLayout(.sizeThatFits)
            .padding(10)
    }
}

#endif
