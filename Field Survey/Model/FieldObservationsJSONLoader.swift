//
//  FieldObservationsJSONLoader.swift
//  Field Survey
//
//  Created by Huiming Sun on 7/16/18.
//  Copyright © 2018 Huiming Sun. All rights reserved.
//

import Foundation

class FieldObservationsJSONLoader {

    class func load(fileName: String) -> [FieldObservation] {
        var observations = [FieldObservation]()

        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            observations = FieldObservationsJSONParser.parse(data)
        }

        return observations
    }
}
