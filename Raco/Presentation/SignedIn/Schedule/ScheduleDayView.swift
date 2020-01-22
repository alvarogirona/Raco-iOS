//
//  ScheduleDayView.swift
//  Raco
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

class ScheduleDayView: NiblessView {

    private var hierarchyNotReady = true

    private var schedule: [Int]? = nil

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        return scrollView
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)

        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10

        return stackView
    }()

    override init (frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    #if DEBUG
    /**
     Initializer used for testing and preview, with schedule on its constructor.
     */
    init (frame: CGRect = .zero,
          schedule: [Int]) {
        self.schedule = schedule
        super.init(frame: frame)
    }
    #endif

    override func didMoveToWindow() {
        guard hierarchyNotReady else {
            return
        }

        hierarchyNotReady = true

        backgroundColor = UIColor.systemBackground

        makeHierarchy()
        activateConstraints()
    }

    private func makeHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }

    private func activateConstraints() {
        activateScrollViewConstraints()
        activateStackViewContraints()
        layoutIfNeeded()
    }

    private func activateScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        let leading = scrollView.leadingAnchor
            .constraint(equalTo: leadingAnchor)
        let trailing = scrollView.trailingAnchor
            .constraint(equalTo: trailingAnchor)
        let top = scrollView.topAnchor
            .constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        let bottom = scrollView.bottomAnchor
            .constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)

        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }

    private func activateStackViewContraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let top = stackView.topAnchor
            .constraint(equalTo: scrollView.topAnchor, constant: 10)
        let leading = stackView.leadingAnchor
            .constraint(equalTo: scrollView.leadingAnchor, constant: 10)
        let trailing = stackView.trailingAnchor
            .constraint(equalTo: scrollView.trailingAnchor, constant: -10)
        let width = stackView.widthAnchor
            .constraint(equalTo: scrollView.widthAnchor, constant: -20)

        NSLayoutConstraint.activate([top, leading, trailing, width])
    }

    /**
     Renders a given schedule.
     */
    func render(schedule: [SubjectClass]) {
        stackView.removeAllArrangedSubviews()

        schedule.forEach { ( subjectClass) in
            let view = createClassView(subjectClass: subjectClass)
            view.backgroundColor = UIColor.systemGreen
            stackView.addArrangedSubview(view)
        }

        stackView.setNeedsLayout()
        stackView.layoutIfNeeded()

        scrollView.contentSize = stackView.bounds.size
    }

    /// TODO: Move to a separe `UIView` subclass
    private func createClassView(subjectClass: SubjectClass) -> UIView {
        let view = ScheduleSubjectClassView(subjectClass: subjectClass)

        view.translatesAutoresizingMaskIntoConstraints = false

        view.layer.cornerRadius = 15.0
        view.layer.masksToBounds = true

        let height = view.heightAnchor.constraint(equalToConstant: 75)

        NSLayoutConstraint.activate([height])

        return view
    }
}

#if canImport(SwiftUI) && DEBUG

import SwiftUI
import Platform

struct ScheduleDay_Preview: PreviewProvider {
    static var dependencyContainer = SignedInDependencyContainer(platformDependencyContainer: PlatformDependencyContainer())

    static let scheduleDayView = ScheduleDayView(schedule: [1,2,2,0,0,4])

    static var previews: some View {
        UIViewPreview {
            scheduleDayView
        }.previewLayout(.sizeThatFits)
            .padding(10)
    }
}

#endif
