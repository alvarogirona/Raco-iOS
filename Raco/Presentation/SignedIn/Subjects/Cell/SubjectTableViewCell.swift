//
//  SubjectTableViewCell.swift
//  Raco
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit
import RacoUIKit
import RacoDomain

class SubjectTableViewCell: NiblessTableViewCell {

    private var hierarchyNotReady = true

    // MARK: Views

    private let subjectNameLabel: UILabel = {
        let label = UILabel()

        label.text = "asdf"

        return label
    }()

    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeHierarchy()
        activateConstraintsCellView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: Render

    func renderSubject(subject: RemoteSubject) {
        subjectNameLabel.text = subject.name
    }


    // MARK: Hierarchy
    func makeHierarchy() {
        guard hierarchyNotReady else {
            return
        }

        hierarchyNotReady = false

        addSubview(subjectNameLabel)
    }

    // MARK: Constraints
    func activateConstraintsCellView() {
        activateConstraintsSubjectNameLabel()
    }

    private func activateConstraintsSubjectNameLabel() {
        subjectNameLabel.translatesAutoresizingMaskIntoConstraints = false

        let leading = subjectNameLabel.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: 10)
        let trailing = subjectNameLabel.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -10)
        let top = subjectNameLabel.topAnchor
            .constraint(equalTo: topAnchor, constant: 10)
        let bottom = subjectNameLabel.bottomAnchor
        .constraint(equalTo: bottomAnchor, constant: -10)

        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SubjectTableViewCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            SubjectTableViewCell(style: .default, reuseIdentifier: "")
        }.previewLayout(.fixed(width: 400, height: 60))
            .padding(10)
    }
}
#endif
