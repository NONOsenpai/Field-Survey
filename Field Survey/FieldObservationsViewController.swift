//
//  FieldObservationsViewController.swift
//  Field Survey
//
//  Created by Chuyang Lin on 7/20/18.
//  Copyright © 2018 Chuyang Lin. All rights reserved.
//

import UIKit

class FieldObservationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var fieldObservationsTableView: UITableView!

    let fieldObservations = FieldObservationsJSONLoader.load(fileName: "field_observations")

    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldObservations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldObservationCell", for: indexPath)
        dateFormatter.dateFormat = "MM-dd, YYYY, HH:mm:ss"
        if let cell = cell as? FieldObservationTableViewCell {
            let fieldObservation = fieldObservations[indexPath.row]
            cell.classificationIconImageView.image = fieldObservation.classification.image
            cell.titleLabel.text = fieldObservation.title
            cell.dateLabel.text =  dateFormatter.string(from: fieldObservation.date)
        }

        return cell
    }

    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldObservationDetailViewController,
           let row = fieldObservationsTableView.indexPathForSelectedRow?.row {
            destination.fieldObservation = fieldObservations[row]
        }
    }

}
