//
//  AuthService.swift
//  FA
//
//  Created by Даниил Мухсинятов on 05.07.2022.
//

import Foundation
import FirebaseCore
import FirebaseAuth

class AuthService {
    static let sharedAuth = AuthService()
    
    private init() { }
    
    private let auth = Auth.auth()
    
    var currentUser: User? {
        return auth.currentUser
    }
    
    func singUp (email: String,
                 password: String,
                 completion: @escaping (Result<User,Error>) -> ()) {
        
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                let userDB = UserDB(id: result.user.uid,
                                    nameUser: "",
                                    adgeUser: "",
                                    theWeightUesr: "",
                                    growthUser: "",
                                    physicalActivityUser: degreeOfPhysicalActivity.minimum.rawValue,
                                    genderUser: sex.male.rawValue)
                DatabaseService.sharedDatabase.createUserDB(user: userDB) { resultDB in
                    switch resultDB {
                    case .success(_):
                        completion(.success(result.user))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func singIn (email: String,
                 password: String,
                 completion: @escaping (Result<User,Error>) -> ()) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
