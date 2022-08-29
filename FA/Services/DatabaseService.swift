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
    private init() { }
    
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

