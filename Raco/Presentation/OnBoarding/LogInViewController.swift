//
//  OnBoardingViewController.swift
//  Raco
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit
import RxSwift
import WebKit
import Platform
import SafariServices

class LogInViewController: NiblessViewController {

    private let rootView: LogInView!
    private let disposeBag = DisposeBag()
    private var safariViewController: SFSafariViewController?

    private let viewModel: LogInViewModel
    private let signedInViewControllerFactory: SignedInViewControllerFactory

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    init(
        viewModel: LogInViewModel,
        rootView: LogInView,
        signedInViewControllerFactory: SignedInViewControllerFactory
    ) {
        self.viewModel = viewModel
        self.rootView = rootView
        self.signedInViewControllerFactory = signedInViewControllerFactory

        super.init()

        rootView.frame = view.frame
        view.addSubview(rootView)

        bindViewModel()
    }

    private func bindViewModel() {
        subscribeToPresentLogInWebView()
        subscribeToAccesCode()
    }

    private func subscribeToAccesCode() {
        viewModel.loggedInSubject
            .subscribe(onNext: { (logged) in
                if logged {
                    self.safariViewController?.dismiss(animated: true, completion: nil)
                    self.presentSignedIn()
                } else {
                    
                }
            }).disposed(by: disposeBag)
    }

    private func presentSignedIn() {
        let signedInViewController = signedInViewControllerFactory.makeSignedInViewController()

        signedInViewController.modalPresentationStyle = .fullScreen

        present(signedInViewController, animated: true, completion: nil)
    }

    private func subscribeToPresentLogInWebView() {
        viewModel.presentLogInWebView
            .asObservable()
            .subscribe(onNext: { _ in
                self.launchAuthOnSafari()
            }).disposed(by: disposeBag)
    }

    private func launchAuthOnSafari() {
        let authParameters = RacoAuthParameters()

        guard let url = AuthUrls.authorizationUrl(authParameters: authParameters) else {
            return

        }

        safariViewController = SFSafariViewController(url: url)
        if let safariViewController = safariViewController {
            present(safariViewController, animated: true, completion: nil)
        }
    }
}

protocol SignedInViewControllerFactory {
    func makeSignedInViewController() -> SignedInViewController
}
