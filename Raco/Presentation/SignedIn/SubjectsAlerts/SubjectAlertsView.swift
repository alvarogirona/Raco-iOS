//
//  AlertsView.swift
//  Raco
//
//  Created by alvaro on 13/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit
import RacoDomain

class SubjectAlertsView: NiblessView {
    
    var hierarchyNotReady = true
    
    private let viewModel: SubjectAlertsViewModel<GetAllSubjectsUseCase, GetAllSubjectAlertsUseCase>
    
    // MARK: Views
    
    var subjectAlertsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        
        return tableView
    }()
    
    // MARK: init
    
    init (
        frame: CGRect = .zero,
        viewModel: SubjectAlertsViewModel<GetAllSubjectsUseCase, GetAllSubjectAlertsUseCase>
    ) {
        self.viewModel = viewModel
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
    }
    
    
    // MARK: Hierarchy
    
    private func makeHierarchy() {
        addSubview(subjectAlertsTableView)
    }
    
    // MARK: Constraints
    
    private func activateConstraints() {
        activateConstraintsSubjectAlertsTableView()
    }
    
    private func activateConstraintsSubjectAlertsTableView() {
        subjectAlertsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = subjectAlertsTableView.leadingAnchor
            .constraint(equalTo: leadingAnchor)
        let trailing = subjectAlertsTableView.trailingAnchor
            .constraint(equalTo: trailingAnchor)
        let top = subjectAlertsTableView.topAnchor
            .constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        let bottom = subjectAlertsTableView.bottomAnchor
            .constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }
    
}
