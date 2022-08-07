//
//  DatabaseService.swift
//  FA
//
//  Created by Даниил Мухсинятов on 05.07.2022.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class DatabaseService {
    static let sharedDatabase = DatabaseService()
    
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    // to do:
//    var workoutRef: CollectionReference {
//        return db.collection("workouts")
//    }
    
    private init() { }
    // to do: 
//    func getCreateAWorkout (by userID: String, complettion: @escaping (Result<[Exercise], Error>)-> ()) {
//        self.workoutRef.getDocuments { qSnap, error in
//            if let qSnap = qSnap {
//                var workouts = [Exercise]()
//                for doc in qSnap.documents {
//                    if let workout = Exercise(doc: doc), workout.usreID == userID{
//                        workouts.append(workout)
//                    }
//                }
//                complettion(.success(workouts))
//            } else if let error = error {
//                complettion(.failure(error))
//            }
//        }
//    }
//
    
//    func setWorkout (workout: WorkoutModel,
//                     complettion: @escaping (Result<WorkoutModel, Error>)-> ()) {
//        workoutRef.document(workout.id).setData(workout.representationWorkoutModel) {error in
//            if let error = error {
//                complettion(.failure(error))
//            } else {
//                self.setExercises(to: workout.id,
//                                  exercises: workout.exerciseWorkoutModel) { result in
//                    switch result {
//
//                    case .success(let exercise):
//                        print(exercise.count)
//                        complettion(.success(workout))
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//                }
//            }
//        }
//    }
    
//    func setExercises (to workoutId: String,
//                      exercises: [Exercise],
//                      complettion: @escaping (Result<[Exercise], Error>)-> ()) {
//        let exerciseRef = workoutRef.document(workoutId).collection("exercises")
//
//        for exercise in exercises {
//            exerciseRef.document(String(exercise.id)).setData(exercise.representationExercise)
//        }
//        complettion(.success(exercises))
//    }
    

    func createUserDB(user: UserDB, completion: @escaping (Result<UserDB,Error>) -> ()) {
        usersRef.document(user.id).setData(user.representationUserDB) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    func getUserDB (completion: @escaping (Result <UserDB, Error>) -> ()) {
        
        usersRef.document(AuthService.sharedAuth.currentUser!.uid).getDocument { docSnapshot, error in
           
            guard let snap = docSnapshot else {return}
            guard let data = snap.data() else {return}
            guard let id = data["id"] as? String else {return}
            guard let nameUser = data["nameUser"] as? String else {return}
            guard let adgeUser = data["adgeUser"] as? String else {return}
            guard let theWeightUesr = data["theWeightUesr"] as? String else {return}
            guard let growthUser = data["growthUser"] as? String else {return}
            guard let physicalActivityUser = data["physicalActivityUser"] as? String else {return}
            guard let genderUser = data["genderUser"] as? String else {return}
            
            let user = UserDB(id: id, nameUser: nameUser, adgeUser: adgeUser, theWeightUesr: theWeightUesr, growthUser: growthUser, physicalActivityUser: physicalActivityUser, genderUser: genderUser)
            
            completion(.success(user))
        }
    }
}

