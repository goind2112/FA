//
//  File.swift
//  FA
//
//  Created by Даниил Мухсинятов on 11.08.2022.
//

import Foundation
import RealmSwift

class RealmServiceWorkout: ObservableObject {
    static let shared = RealmServiceWorkout()
    private(set) var localRealmWorkout: Realm?
    @Published private(set) var workoutArray: [WorkoutModel] = []
    @Published private(set) var workoutId = ObjectId()
    @Published private(set) var workoutName = ""
    
    private init () {
        openRealm()
        getWorkout()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealmWorkout = try Realm()
            
        } catch {
            print("Error opening Realme: \(error)")
        }
    }
    
    func addWorkout (name: String) {
        if let localRealm = localRealmWorkout {
            do {
                try localRealm.write {
                    let newWorkout = WorkoutModel(value: ["name": name])
                    localRealm.add(newWorkout)
                    getWorkout()
                    print("Added new workout: \(newWorkout)")
                }
            } catch {
                print("Error adding workout: \(error)")
            }
        }
    }
    
    func getWorkout () {
        if let localRealm = localRealmWorkout {
            let allWorkout = localRealm.objects(WorkoutModel.self)
            // без  workoutArray = [] error: "Object has been deleted or invalidated." при удалении из массива
            workoutArray = []
            allWorkout.forEach { workout in
                workoutArray.append(workout)
            }
        }
    }
    
    func updateWorkout(id: ObjectId, name: String) {
        if let localRealm = localRealmWorkout {
            do{
                let workoutToUpdate = localRealm.objects(WorkoutModel.self).filter(NSPredicate(format: "id == %@", id))
                guard !workoutToUpdate.isEmpty else {return}
                
                try localRealm.write{
                    workoutToUpdate[0].name = name
                    getWorkout()
                    print("Updating workout with id: \(id)! status: \(name)")
                }
                
            } catch {
                print("Error updating workout: \(id) to Realm: \(error)")
            }
        }
    }
    
    func deleteWorkout(id: ObjectId) {
        DispatchQueue.main.async {
            if let localRealm = self.localRealmWorkout {
                do {
                    let workoutToDelete = localRealm.objects(WorkoutModel.self).filter(NSPredicate(format: "id == %@", id))
                    guard !workoutToDelete.isEmpty else {return}
                    
                    try localRealm.write{
                        localRealm.delete(workoutToDelete)
                        self.getWorkout()
                        print("Delited workout with id \(id)")
                    }
                    
                } catch {
                    print("Error deleting workout \(id) to Realm: \(error)")
                }
            }
        }
    }
    
    func workoutTransferId (name: ObjectId) {
        for workoutModel in workoutArray {
            if  workoutModel.id == name {
                workoutId = workoutModel.id
                workoutName = workoutModel.name
            }
        }
    }
}
