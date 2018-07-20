//
//  FieldObservationTableViewCell.swift
//  Field Survey
//
//  Created by Chuyang Lin on 7/20/18.
//  Copyright © 2018 Chuyang Lin. All rights reserved.
//

import UIKit

class FieldObservationTableViewCell: UITableViewCell {


    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var classificationIconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
