//
//  FieldObservationDetailViewController.swift
//  Field Survey
//
//  Created by Chuyang Lin on 7/20/18.
//  Copyright © 2018 Chuyang Lin. All rights reserved.
//

import UIKit

class FieldObservationDetailViewController: UIViewController {

    var fieldObservation: FieldObservation?

    var dateFormatter = DateFormatter()

    @IBOutlet weak var classificationIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        classificationIconImageView.image = fieldObservation?.classification.image
        titleLabel.text = fieldObservation?.title
        descriptionLabel.text = fieldObservation?.description

        if let date = fieldObservation?.date {
            dateLabel.text = dateFormatter.string(from: date)
        } else {
            dateLabel.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
