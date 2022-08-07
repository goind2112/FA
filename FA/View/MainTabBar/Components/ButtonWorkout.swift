//
//  ButtonWorkoutViewModel.swift
//  FA
//
//  Created by Даниил Мухсинятов on 27.06.2022.
//

import SwiftUI

struct ButtonWorkout: View {
    var workoutModel: WorkoutModel
    var body: some View {
        Button  {
            //
        } label: {
            Text (workoutModel.name)
        }
    }
    }



struct ButtonWorkoutViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWorkout(workoutModel: WorkoutModel(name: "понедельник"))
    }
}
