//
//  MainTadView.swift
//  FA
//
//  Created by Даниил Мухсинятов on 08.06.2022.
//

import SwiftUI

struct MainTadView: View {
    
    @StateObject var viewModelUser: AccauntViewSettingsViewModel
    @StateObject var calorieCalculatorModel: СalorieCalculatorViewModel
    var viewModel: MainTabBarViewModel
    var body: some View {
        TabView {
            //to do:
//            WorkoutView(items: CreateAWorkoutViewModel(createAWorkoutModel: WorkoutModel(name: "")))
//                .tabItem {
//                    VStack {
//                        Image (systemName: "bolt.heart.fill")
//                        Text ("WORKOUT")
//                    }
//                }
            CalorieCalculatorView(viewСalorieCalculatorViewModel: СalorieCalculatorViewModel(calorieCalculatorModel: CalorieCalculatorModel(adgeCalculator: "", theWeightCalculator: "", growthCalculator: "", genderCalculator: "", physicalActivityCalculator: "")))
                .tabItem {
                    VStack {
                        Image (systemName: "plus.forwardslash.minus")
                        Text ("СALORIE CALCULATOR")
                    }
                    
                }
            AccauntView (viewModelUser: AccauntViewSettingsViewModel(profileUser: UserDB(id: "\(viewModelUser.profileUser.id)", nameUser: "\(viewModelUser.profileUser.nameUser)", adgeUser: "\(viewModelUser.profileUser.adgeUser)", theWeightUesr: "\(viewModelUser.profileUser.theWeightUesr)", growthUser: "\(viewModelUser.profileUser.growthUser)", physicalActivityUser: "\(viewModelUser.profileUser.physicalActivityUser)", genderUser: "\(viewModelUser.profileUser.genderUser)")))
                .tabItem {
                    VStack {
                        Image (systemName: "person")
                        Text ("ACCAUNT")
                    }
                }
        }
        .onAppear{
            self.viewModelUser.getUserViewModel()
        }
    }
}

