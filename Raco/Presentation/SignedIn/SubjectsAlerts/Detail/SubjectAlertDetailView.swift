//
//  SubjectAlertDetailView.swift
//  Raco
//
//  Created by alvaro on 26/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

class SubjectAlertDetailView: NiblessView {

    private var hierarchyNotReady = true

    private let descriptionTextView: UITextView = {
        let textView = UITextView()

        return textView
    }()

    func render(subjectAlert: SubjectAlert) {
        if isHtml(text: subjectAlert.text) {
            let htmlData = NSString(string: subjectAlert.text).data(using: String.Encoding.utf8.rawValue)
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
            ]
            let attributedString = try! NSAttributedString(data: htmlData!,
                                                           options: options,
                                                           documentAttributes: nil)
            descriptionTextView.attributedText = attributedString
        } else {
            descriptionTextView.text = subjectAlert.text
        }

        descriptionTextView.textColor = UIColor.label
        descriptionTextView.font = UIFont.systemFont(ofSize: 16)

    }

    private func isHtml(text: String) -> Bool {
        return text.contains("<")
    }

    override func didMoveToWindow() {

        guard hierarchyNotReady else {
            return
        }

        hierarchyNotReady = false

        backgroundColor = .systemBackground

        makeHierarchy()
        activateConstraints()
    }

    private func makeHierarchy() {
        addSubview(descriptionTextView)
    }

    private func activateConstraints() {
        activateDescriptionTextViewConstraints()
    }

    private func activateDescriptionTextViewConstraints() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false

        let leading = descriptionTextView.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: 10)
        let trailing = descriptionTextView.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -10)
        let top = descriptionTextView.topAnchor
            .constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10)
        let bottom = descriptionTextView.bottomAnchor
            .constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)

        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }

}


#if DEBUG && canImport(SwiftUI)

import SwiftUI

struct SubjectAlertDetailView_Preview: PreviewProvider {

    static var previews: some View {
        UIViewPreview {
            SubjectAlertDetailView()
        }.previewLayout(.sizeThatFits)
            .padding(10)
    }
}

#endif
