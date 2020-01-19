//
//  LogInView.swift
//  Raco
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit
import RacoUIKit
import RxSwift
import RxCocoa

class LogInView: NiblessView {

    var hierarchyNotReady = true

    private let viewModel: LogInViewModel!
    private let disposeBag = DisposeBag()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()

        return stackView
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton()

        button.backgroundColor = UIColor.flatBlue()
        button.setTitle("Iniciar sesión", for: .normal)
        button.layer.cornerRadius = 25.0
        button.layer.masksToBounds = true

        return button
    }()

    lazy var jediImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo-jedi")
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    init (frame: CGRect = .zero,
          viewModel: LogInViewModel) {

        self.viewModel = viewModel
        super.init(frame: frame)
    }

    override func didMoveToWindow() {

        guard hierarchyNotReady else {
            return
        }

        hierarchyNotReady = false

        backgroundColor = UIColor(named: "backgroundColor")
        makeHierarchy()
        activateConstraints()
        bindViewModel()
    }

    private func makeHierarchy() {
        stackView.addArrangedSubview(loginButton)
        addSubview(stackView)
        addSubview(jediImageView)
    }

    private func activateConstraints() {
        activateStackViewConstraints()
        activateJediImageViewConstraints()
    }

    private func bindViewModel() {
        loginButton.addTarget(
            viewModel,
            action: #selector(viewModel.loginSelected),
            for: .touchUpInside)
    }

    private func activateJediImageViewConstraints() {
        jediImageView.translatesAutoresizingMaskIntoConstraints = false

        let width = jediImageView.widthAnchor
            .constraint(equalToConstant: 200)
        let heigth = jediImageView.heightAnchor
            .constraint(equalToConstant: 100)
        let centerX = jediImageView.centerXAnchor
            .constraint(equalTo: centerXAnchor)
        let bottom = jediImageView.bottomAnchor
            .constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                        constant: 16)

        NSLayoutConstraint.activate([width, heigth, centerX, bottom])

    }

    private func activateStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let leading = stackView.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: 10)
        let trailing = stackView.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -10)
        let height = stackView.heightAnchor
            .constraint(equalToConstant: 50.0)
        let centerY = stackView.centerYAnchor
            .constraint(equalTo: centerYAnchor)

        NSLayoutConstraint.activate([leading, trailing, height, centerY])

    }

}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct LoginRootView_Preview: PreviewProvider {
    static var dependencyContainer = OnBoardingDependencyContainer()

    static var previews: some View {
        UIViewPreview {

            LogInView(viewModel: dependencyContainer.makeLogInViewModel())
        }.previewLayout(.sizeThatFits)
            .padding(10)
    }
}
#endif
