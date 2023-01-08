//
//  CreateAWorkoutModel.swift
//  FA
//
//  Created by Даниил Мухсинятов on 17.07.2022.
//

import Foundation
import RealmSwift

class ExerciseModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var exerciseDescription = ""
    @Persisted var exerciseName = ""
    @Persisted var exerciseNumberOfRepetitions = ""
    @Persisted var workoutId = ObjectId()
}
