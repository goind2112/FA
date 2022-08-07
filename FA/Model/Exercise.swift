//
//  CreateAWorkoutModel.swift
//  FA
//
//  Created by Даниил Мухсинятов on 17.07.2022.
//

import Foundation
import FirebaseFirestore

struct Exercise: Identifiable,Equatable {
   
    var id: Int
    var exerciseDescription: String
    var exerciseName: String
    var exerciseNumberOfRepetitions: String
    var usreID: String
    
    var representationExercise: [String: Any] {
        var repres = [String: Any]()
        repres ["id"] = id
        repres ["exerciseDescription"] = exerciseDescription
        repres ["exerciseName"] = exerciseName
        repres ["exerciseNumberOfRepetitions"] = exerciseNumberOfRepetitions
        repres ["usreID"] = usreID
        
        return repres
    }
    
    init (id: Int,
          exerciseDescription: String,
          exerciseName: String,
          exerciseNumberOfRepetitions: String,
          usreID: String) {
        self.id = id
        self.exerciseDescription = exerciseDescription
        self.exerciseName = exerciseName
        self.exerciseNumberOfRepetitions = exerciseNumberOfRepetitions
        self.usreID = usreID
    }
    
    init?(doc: QueryDocumentSnapshot){
        let data = doc.data()
        guard let id = data["id"] as? Int else {return nil}
        guard let exerciseDescription = data["exerciseDescription"] as? String else {return nil}
        guard let exerciseName = data["exerciseName"] as? String else {return nil}
        guard let exerciseNumberOfRepetitions = data["exerciseNumberOfRepetitions"] as? String else {return nil}
        guard let usreID = data["usreID"] as? String else {return nil}
        
        self.id = id
        self.exerciseDescription = exerciseDescription
        self.exerciseName = exerciseName
        self.exerciseNumberOfRepetitions = exerciseNumberOfRepetitions
        self.usreID = usreID
    }
}
