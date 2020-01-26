//
//  SubjectAlertTableViewCell.swift
//  Raco
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit
import RacoUIKit

class SubjectAlertTableViewCell: NiblessTableViewCell {

    private var hierarchyNotReady = true

    // MARK: Views
    private let alertTitleLabel: UILabel = {
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

    func renderSubjectAlert(subjectAlert: SubjectAlert) {
        alertTitleLabel.text = subjectAlert.title
    }


    // MARK: Hierarchy

    func makeHierarchy() {
        guard hierarchyNotReady else {
            return
        }

        hierarchyNotReady = false

        addSubview(alertTitleLabel)
    }

    // MARK: Constraints

    func activateConstraintsCellView() {
        activateConstraintsSubjectNameLabel()
    }

    private func activateConstraintsSubjectNameLabel() {
        alertTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        let leading = alertTitleLabel.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: 10)
        let trailing = alertTitleLabel.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -10)
        let top = alertTitleLabel.topAnchor
            .constraint(equalTo: topAnchor, constant: 10)
        let bottom = alertTitleLabel.bottomAnchor
        .constraint(equalTo: bottomAnchor, constant: -10)

        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }


    // MARK: Cell selected
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        // super.setSelected(selected, animated: animated)
    }

}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SubjectAlertTableViewCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            SubjectAlertTableViewCell(style: .default, reuseIdentifier: "")
        }.previewLayout(.fixed(width: 400, height: 60))
            .padding(10)
    }
}
#endif
