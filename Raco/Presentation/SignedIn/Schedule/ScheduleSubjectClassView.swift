//
//  ScheduleSubjectClassView.swift
//  Raco
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

class ScheduleSubjectClassView: NiblessView {

    private var hierarchyNotReady = true

    private let subjectClass: SubjectClass

    private let scheduleLabel: UILabel = {
        let label = UILabel()

        let font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)

        label.textColor = .white
        label.alpha = 0.8
        label.font = font

        return label
    }()

    private let classTypeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))

        let font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)

        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.textColor = .systemBlue
        label.backgroundColor = .white
        label.textAlignment = .center
        label.alpha = 0.8
        label.font = font

        return label
    }()

    private let classroomLabel: UILabel = {
        let label = UILabel()

        let font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)

        label.textColor = .white
        label.alpha = 0.8
        label.font = font

        return label
    }()

    private let subjectNameLabel: UILabel = {
        let label = UILabel()

        let font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.heavy)

        label.textColor = .white
        label.alpha = 1.0
        label.font = font

        return label
    }()

    init(frame: CGRect = .zero,
         subjectClass: SubjectClass) {
        self.subjectClass = subjectClass
        super.init(frame: frame)
    }

    override func didMoveToWindow() {

        guard hierarchyNotReady else {
            return
        }

        hierarchyNotReady = true

        backgroundColor = .systemBlue

        makeRoundedCorners()
        makeHierarchy()
        activateConstraints()

        render(subjectClass: subjectClass)
    }

    private func makeRoundedCorners() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }

    private func makeHierarchy() {
        addSubview(classTypeLabel)
        addSubview(classroomLabel)
        addSubview(scheduleLabel)
        addSubview(subjectNameLabel)
    }

    private func activateConstraints() {
        activateClassTypeConstraints()
        activateClassroomLabelConstraints()
        activateScheduleConstraints()
        activateSubjectNameConstraints()
    }

    private func activateClassTypeConstraints() {
        classTypeLabel.translatesAutoresizingMaskIntoConstraints = false

        let leading = classTypeLabel.leadingAnchor
        .constraint(equalTo: leadingAnchor, constant: 20)
        let top = classTypeLabel.topAnchor
        .constraint(equalTo: topAnchor, constant: 10)
        let width = classTypeLabel.widthAnchor
            .constraint(equalToConstant: classTypeLabel.bounds.width)
        let height = classTypeLabel.heightAnchor
            .constraint(equalToConstant: classTypeLabel.bounds.height)

        NSLayoutConstraint.activate([leading, top, width, height])
    }

    private func activateClassroomLabelConstraints() {
        classroomLabel.translatesAutoresizingMaskIntoConstraints = false

        let trailing = classroomLabel.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -20)
        let top = classroomLabel.topAnchor
            .constraint(equalTo: topAnchor, constant: 10)
        let width = classroomLabel.widthAnchor
            .constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([trailing, top, width])
    }

    private func activateScheduleConstraints() {
        scheduleLabel.translatesAutoresizingMaskIntoConstraints = false

        let leading = scheduleLabel.leadingAnchor
            .constraint(equalTo: classTypeLabel.trailingAnchor, constant: 5)
        let trailing = scheduleLabel.trailingAnchor
            .constraint(equalTo: classroomLabel.leadingAnchor, constant: -10)
        let top = scheduleLabel.topAnchor
            .constraint(equalTo: topAnchor, constant: 10)

        NSLayoutConstraint.activate([leading, trailing, top])
    }

    private func activateSubjectNameConstraints() {
        subjectNameLabel.translatesAutoresizingMaskIntoConstraints = false

        let leading = subjectNameLabel.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: 20)
        let trailing = subjectNameLabel.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -10)
        let top = subjectNameLabel.topAnchor
            .constraint(equalTo: scheduleLabel.bottomAnchor, constant: 5)

        NSLayoutConstraint.activate([leading, trailing, top])
    }

    private func render(subjectClass: SubjectClass) {
        scheduleLabel.text = "\(subjectClass.startHour) - \(subjectClass.endHour)"

        subjectNameLabel.text = subjectClass.subject.name

        classroomLabel.text = "A6001"

        classTypeLabel.text = subjectClass.classType
    }

}

#if canImport(SwiftUI) && DEBUG

import SwiftUI
import Platform

struct ScheduleSubjectClass_Preview: PreviewProvider {
    static var dependencyContainer = SignedInDependencyContainer(platformDependencyContainer: PlatformDependencyContainer())

    static let scheduleSubjectClass = ScheduleSubjectClassView(
        subjectClass: SubjectClass(subject: ScheduleSubject(name: "Mineria de dades"),
                                   classType: "T",
                                   startHour: "10:00",
                                   duration: 2,
                                   weekDay: 1)
    )

    static var previews: some View {
        UIViewPreview {
            scheduleSubjectClass
        }.previewLayout(.fixed(width: 400, height: 90))
            .padding(10)
    }
}

#endif
