//
//  WorkoutModel.swift
//  FA
//
//  Created by Даниил Мухсинятов on 27.06.2022.
//

import Foundation

struct WorkoutModel: Identifiable{
    var id: String = UUID().uuidString
    var name: String
    var exerciseWorkoutModel = [Exercise]()
    
    var representationWorkoutModel: [String: Any] {
        var repres = [String: Any] ()
        repres["id"] = id
        repres["name"] = name
        
        return repres
    }
}

