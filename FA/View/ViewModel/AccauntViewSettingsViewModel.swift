//
//  UserViewModel.swift
//  FA
//
//  Created by Даниил Мухсинятов on 10.07.2022.
//

import Foundation

class AccauntViewSettingsViewModel: ObservableObject {
    
    @Published var profileUser: UserDB
    
    init (profileUser: UserDB) {
        self.profileUser = profileUser
    }
    
    func setUserViewModel() {
        DatabaseService.sharedDatabase.createUserDB(user: self.profileUser) { result in
            switch result {
            case .success(let user):
                print("\(user.nameUser)")
            case .failure(let error):
                print("Ошибка отправки данных \(error.localizedDescription)")
            }
        }
    }
    
    func getUserViewModel() {
        DatabaseService.sharedDatabase.getUserDB { result in
            switch result{
                
            case .success(let user):
                self.profileUser = user
            case .failure(let errore):
                print(errore.localizedDescription)
            }
        }
    }
    
    func calorieManagerWeightRetention (adgeCalculator: String, theWeightCalculator: String, growthCalculator: String, physicalActivityCalculator: degreeOfPhysicalActivity.RawValue, genderCalculator: String) -> Int {
        
        var sex: Double {
            var sexInt = 0
            if genderCalculator == "Муж" {
                sexInt = Int(5.0)
            } else if genderCalculator == "Жен"{
                sexInt = Int(-161.0)
            }
            return Double(sexInt)
        }
        
        var physicalActivity: Double {
            var physicalA = 0.0
            if physicalActivityCalculator == "Минимум/отсутствие" {
                physicalA = 1.2
            } else if physicalActivityCalculator == "Слабая активность" {
                physicalA = 1.375
            } else if physicalActivityCalculator == "Средняя активность" {
                physicalA = 1.55
            } else if physicalActivityCalculator == "Высокая активность"{
                physicalA = 1.725
            } else if physicalActivityCalculator == "Очень высокая активность" {
                physicalA = 1.9
            }
            return physicalA
        }
        
        var calorie = 0
        let weight = Double(theWeightCalculator) ?? 0
        let growth = Double(growthCalculator) ?? 0
        let adge = Double(adgeCalculator) ?? 0
        
        calorie = Int((10 * weight + 6.25 * growth - 5 * adge + sex) * physicalActivity)
        
        if genderCalculator == "Муж" {
            if calorie < 1400 {
                calorie = 1400
            }
        } else {
            if  calorie < 1200 {
                calorie = 1200
            }
        }
        
        return calorie
    }
    
    func calorieManagerWeightLoss (adgeCalculator: String, theWeightCalculator: String, growthCalculator: String, physicalActivityCalculator: degreeOfPhysicalActivity.RawValue, genderCalculator: String) -> Int {
        
        var sex: Double {
            var sexInt = 0
            if genderCalculator == "Муж" {
                sexInt = Int(5.0)
            } else if genderCalculator == "Жен"{
                sexInt = Int(-161.0)
            }
            return Double(sexInt)
        }
        
        var physicalActivity: Double {
            var physicalA = 0.0
            if physicalActivityCalculator == "Минимум/отсутствие" {
                physicalA = 1.2
            } else if physicalActivityCalculator == "Слабая активность" {
                physicalA = 1.375
            } else if physicalActivityCalculator == "Средняя активность" {
                physicalA = 1.55
            } else if physicalActivityCalculator == "Высокая активность"{
                physicalA = 1.725
            } else if physicalActivityCalculator == "Очень высокая активность" {
                physicalA = 1.9
            }
            return physicalA
        }
        
        var calorie = 0
        let weight = Double(theWeightCalculator) ?? 0
        let growth = Double(growthCalculator) ?? 0
        let adge = Double(adgeCalculator) ?? 0
        
        calorie = Int((10 * weight + 6.25 * growth - 5 * adge + sex) * physicalActivity-250)
        
        if genderCalculator == "Муж" {
            if calorie < 1400 {
                calorie = 1400
            }
        } else {
            if  calorie < 1200 {
                calorie = 1200
            }
        }
        
        return calorie
    }
    
    func calorieManagerFastWeightLoss (adgeCalculator: String, theWeightCalculator: String, growthCalculator: String, physicalActivityCalculator: degreeOfPhysicalActivity.RawValue, genderCalculator: String) -> Int {
        
        var sex: Double {
            var sexInt = 0
            if genderCalculator == "Муж" {
                sexInt = Int(5.0)
            } else if genderCalculator == "Жен"{
                sexInt = Int(-161.0)
            }
            return Double(sexInt)
        }
        
        var physicalActivity: Double {
            var physicalA = 0.0
            if physicalActivityCalculator == "Минимум/отсутствие" {
                physicalA = 1.2
            } else if physicalActivityCalculator == "Слабая активность" {
                physicalA = 1.375
            } else if physicalActivityCalculator == "Средняя активность" {
                physicalA = 1.55
            } else if physicalActivityCalculator == "Высокая активность"{
                physicalA = 1.725
            } else if physicalActivityCalculator == "Очень высокая активность" {
                physicalA = 1.9
            }
            return physicalA
        }
        
        var calorie = 0
        let weight = Double(theWeightCalculator) ?? 0
        let growth = Double(growthCalculator) ?? 0
        let adge = Double(adgeCalculator) ?? 0
        
        calorie = Int((10 * weight + 6.25 * growth - 5 * adge + sex) * physicalActivity - 500)
        
        if genderCalculator == "Муж" {
            if calorie < 1400 {
                calorie = 1400
            }
        } else {
            if  calorie < 1200 {
                calorie = 1200
            }
        }
        
        return calorie
    }
    
}
