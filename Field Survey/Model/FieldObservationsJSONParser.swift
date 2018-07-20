//
//  FieldObservationsJSONParser.swift
//  Field Survey
//
//  Created by Huiming Sun on 7/16/18.
//  Copyright © 2018 Huiming Sun. All rights reserved.
//

import Foundation

class FieldObservationsJSONParser {

    static let dateFormatter = DateFormatter()

    class func parse(_ data: Data) -> [FieldObservation] {
        var fieldObservations = [FieldObservation]()

        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"

        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
           let root = json as? [String: Any],
           let status = root["status"] as? String,
           status == "ok" {

            if let observations = root["observations"] as? [Any] {
                for observation in observations {
                    if let observation = observation as? [String: String] {
                        if let classificationName = observation["classification"],
                           let title = observation["title"],
                           let description = observation["description"],
                           let dateString = observation["date"],
                           let date = dateFormatter.date(from: dateString) {

                            if let fieldObservation = FieldObservation(classificationName: classificationName, title: title, description: description, date: date) {
                                fieldObservations.append(fieldObservation)
                            }
                        }
                    }
                }
            }
        }


        return fieldObservations
    }

}
