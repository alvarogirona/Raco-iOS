//
//  ScheduleViewController.swift
//  Raco
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

class ScheduleViewController: NiblessViewController {

    private let viewModel: ScheduleViewModel

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Horario"
    }

    init (viewModel: ScheduleViewModel) {
        self.viewModel = viewModel

        super.init()

        let scheduleDayView = ScheduleDayView(schedule: [1,2,2,1,4])

        scheduleDayView.frame = view.frame
        view.addSubview(scheduleDayView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
