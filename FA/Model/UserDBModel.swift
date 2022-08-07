//
//  User.swift
//  FA
//
//  Created by Даниил Мухсинятов on 05.07.2022.
//

import Foundation

struct UserDB: Identifiable, Hashable {
    var id: String
    var nameUser: String
    var adgeUser: String
    var theWeightUesr: String
    var growthUser: String
    var physicalActivityUser: degreeOfPhysicalActivity.RawValue
    var genderUser: sex.RawValue
    //    var CalorieIntakeToMaintainWeight: String
    //    var CalorieIntakeForWeightLoss: String
    //    var CalorieIntakeForFastWeightIoss: String
    
    
    var representationUserDB: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["nameUser"] = self.nameUser
        repres["adgeUser"] = self.adgeUser
        repres["theWeightUesr"] = self.theWeightUesr
        repres["growthUser"] = self.growthUser
        repres["physicalActivityUser"] = self.physicalActivityUser
        repres["genderUser"] = self.genderUser
        
        return repres
    }
}
