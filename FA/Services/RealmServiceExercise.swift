//
//  RealmManager.swift
//  FA
//
//  Created by Даниил Мухсинятов on 11.08.2022.
//

import Foundation
import RealmSwift
import SwiftUI

class RealmServiceExercise: ObservableObject {
    static let shared = RealmServiceExercise()
    private(set) var localRealm: Realm?
    @Published private(set) var exerciseArray: [Exercise] = []
    
    private init () {
        openRealm()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch {
            print("Error opening Realme: \(error)")
        }
    }
    
    func addExercise (exerciseName: String, exerciseDescription: String, exerciseNumberOfRepetitions: String, workoutId: ObjectId) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newExercise = Exercise(value: ["exerciseName": exerciseName, "exerciseDescription": exerciseDescription, "exerciseNumberOfRepetitions": exerciseNumberOfRepetitions, "workoutId": workoutId])
                    localRealm.add(newExercise)
                    getExercise(workoutId: workoutId)
                    print("Added new exercise: \(newExercise)")
                }
            } catch {
                print("Error adding exercise: \(error)")
            }
        }
    }
    func getExercise (workoutId: ObjectId) {
        if let localRealm = localRealm {
            let allExerciseInWorkout = localRealm.objects(Exercise.self)
            exerciseArray = []
            allExerciseInWorkout.forEach { exercise in
                if exercise.workoutId == workoutId {
                exerciseArray.append(exercise)
                }
            }
        }
        print("-------\(exerciseArray.count)---------")
}
    
    func updateExercise(id: ObjectId, exerciseName: String, exerciseDescription: String, exerciseNumberOfRepetitions: String, workoutId: ObjectId) {
        if let localRealm = localRealm {
            do{
               let exerciseToUpdate = localRealm.objects(Exercise.self).filter(NSPredicate(format: "id == %@", id))
                guard !exerciseToUpdate.isEmpty else {return}
                
                try localRealm.write{
                    exerciseToUpdate[0].exerciseName = exerciseName
                    exerciseToUpdate[0].exerciseDescription = exerciseDescription
                    exerciseToUpdate[0].exerciseNumberOfRepetitions = exerciseNumberOfRepetitions
                    getExercise(workoutId: workoutId)
                    print("Updating exercise with id: \(id)! status: \(exerciseName), \(exerciseDescription),\(exerciseNumberOfRepetitions)")
                }
                
            } catch {
                print("Error updating exercise: \(id) to Realm: \(error)")
            }
        }
    }
    func deleteExercise(id: ObjectId, workoutId: ObjectId) {
        if let localRealm = localRealm {
            do {
                let exerciseToDelete = localRealm.objects(Exercise.self).filter(NSPredicate(format: "id == %@", id))
                 guard !exerciseToDelete.isEmpty else {return}
                
                try localRealm.write{
                    localRealm.delete(exerciseToDelete)
                    getExercise(workoutId: workoutId)
                    print("Delited exercise with id \(id)")
                }
                
            } catch {
                print("Error deleting exercise \(id) to Realm: \(error)")
            }
        }
        
    }
    
    func deleteAllExerciseToWorkoute(workoutId: ObjectId) {
        if let localRealm = localRealm {
            do {
                let exerciseToDelete = localRealm.objects(Exercise.self).filter(NSPredicate(format: "workoutId == %@", workoutId))
                 guard !exerciseToDelete.isEmpty else {return}
                
                try localRealm.write{
                    localRealm.delete(exerciseToDelete)
                    getExercise(workoutId: workoutId)
                    print("Exercise to workout \(exerciseToDelete.count)")
                }
                
            } catch {
                print("Error deleting exercise \(workoutId) to Realm: \(error)")
            }
        }
        
    }
}
