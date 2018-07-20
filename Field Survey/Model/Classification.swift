//
//  Classification.swift
//  Field Survey
//
//  Created by Huiming Sun on 7/16/18.
//  Copyright © 2018 Huiming Sun. All rights reserved.
//

import UIKit

enum Classification: String {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile

    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}

