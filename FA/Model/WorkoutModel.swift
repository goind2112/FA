//
//  WorkoutModel.swift
//  FA
//
//  Created by Даниил Мухсинятов on 27.06.2022.
//

import Foundation
import RealmSwift

class WorkoutModel: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name = ""
}

