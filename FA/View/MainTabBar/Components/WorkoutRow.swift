//
//  ButtonWorkoutViewModel.swift
//  FA
//
//  Created by Даниил Мухсинятов on 27.06.2022.
//

import SwiftUI

struct WorkoutRow: View {
    
    @State private var showCreateWorkout = false
    @EnvironmentObject var realmServiceExercise: RealmServiceExercise
    @EnvironmentObject var realmServiceWorkout: RealmServiceWorkout
    
    var name: String
    
    var body: some View {
        Text (name)
            .foregroundColor(.black)
    }
}



struct WorkoutRow_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRow(name: "понедельник")
    }
}
