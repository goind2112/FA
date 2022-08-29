//
//  ButtonWorkoutViewModel.swift
//  FA
//
//  Created by Даниил Мухсинятов on 27.06.2022.
//

import SwiftUI

struct ButtonWorkout: View {
    
    @State private var showCreateWorkout = false
    @EnvironmentObject var realmServiceExercise: RealmServiceExercise
    @EnvironmentObject var realmServiceWorkout: RealmServiceWorkout
    
    var name: String
    
    var body: some View {
        VStack {
            Button  {
                showCreateWorkout.toggle()
                realmServiceWorkout.workoutTransferId(name: name)
                realmServiceExercise.getExercise(workoutId: realmServiceWorkout.workoutId)
                print("------\(realmServiceExercise.exerciseArray)----------------")
            } label: {
                Text (name)
                    .foregroundColor(.black)
            }
        }
        .fullScreenCover(isPresented: $showCreateWorkout) {
            CreateAWorkout()
                .environmentObject(RealmServiceExercise.shared)
        }
    }
}



struct ButtonWorkoutViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWorkout(name: "понедельник")
    }
}
