//
//  N.swift
//  FA
//
//  Created by Даниил Мухсинятов on 26.06.2022.
//

import SwiftUI
import SpriteKit
import IQKeyboardManagerSwift

struct CreateAWorkout: View {
    @EnvironmentObject var realmServiceExercise: RealmServiceExercise
    @EnvironmentObject var realmServiceWorkout: RealmServiceWorkout
    @State var isMainTabViewShow = false
    @State var isEditing = false
    @State var showsCreateAExercise = false
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 140)),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    Text(self.realmServiceWorkout.workoutName)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.offWhite)
                    
                    List {
                        ForEach(realmServiceExercise.exerciseArray, id: \.id) { item in
                            if !item.isInvalidated {
                                ExerciseRow(exerciseName: item.exerciseName, exerciseDescription: item.exerciseDescription, exerciseNumberOfRepetitions: item.exerciseNumberOfRepetitions)
                                    .swipeActions(edge: .trailing)
                                {
                                    Button(role: .destructive) {
                                        realmServiceExercise.deleteExercise(id: item.id, workoutId: item.workoutId)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                                .background(Color.white)
                                .cornerRadius(12)
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                    .navigationBarTitle("Создание тренировки", displayMode:.inline)
                    .navigationBarItems(leading:  Button {
                        isMainTabViewShow.toggle()
                    } label: {
                        Text("Выход")
                            .foregroundColor(.gray)
                        Spacer()
                        
                    }, trailing: Button(action: {
                        showsCreateAExercise = true
                    }, label: {
                        Image(systemName: "plus")  .foregroundColor(.gray)
                    }))
                    .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
                }
                CreateAExercise(showsCreateAExercise: $showsCreateAExercise)
                    .environmentObject(RealmServiceWorkout.shared)
                    .environmentObject(RealmServiceExercise.shared)
                    .offset(y: showsCreateAExercise ?
                            UIScreen.main.bounds.height / 10
                            :
                                UIScreen.main.bounds.height)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            .background(Color.offWhite)
            .fullScreenCover(isPresented: $isMainTabViewShow) {
                MainTadView(viewModelUser: AccauntViewSettingsViewModel.init(profileUser: UserDB.init(id: "", nameUser: "", adgeUser: "", theWeightUesr: "", growthUser: "", physicalActivityUser: degreeOfPhysicalActivity.minimum.rawValue, genderUser: sex.male.rawValue)), calorieCalculatorModel: СalorieCalculatorViewModel(calorieCalculatorModel: CalorieCalculatorModel(adgeCalculator: "", theWeightCalculator: "", growthCalculator: "",genderCalculator: "", physicalActivityCalculator: "")), viewModel: mainTabBarViewModel)
            }
        }
        .onAppear{
            realmServiceExercise.getExercise(workoutId: realmServiceWorkout.workoutId)
        }
    }
}


struct CreateAWorkout_Previews: PreviewProvider {
    static var previews: some View {
        CreateAWorkout()
            .environmentObject(RealmServiceWorkout.shared)
            .environmentObject(RealmServiceExercise.shared)
    }
}
