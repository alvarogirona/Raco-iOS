//
//  SubjectAlertDetailViewController.swift
//  Raco
//
//  Created by alvaro on 26/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

class SubjectAlertDetailViewController: NiblessViewController {

    private let subjectAlert: SubjectAlert
    private let detailView: SubjectAlertDetailView

    init (subjectAlert: SubjectAlert) {
        self.subjectAlert = subjectAlert
        self.detailView = SubjectAlertDetailView()
        
        super.init()

        detailView.frame = view.frame
        view.addSubview(detailView)
        detailView.render(subjectAlert: subjectAlert)
        navigationItem.title = subjectAlert.title
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
