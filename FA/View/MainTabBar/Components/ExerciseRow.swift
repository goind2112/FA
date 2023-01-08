//
//  CreateAWorkoutListElement.swift
//  FA
//
//  Created by Даниил Мухсинятов on 24.07.2022.
//

import SwiftUI


struct ExerciseRow: View {
    
    var exerciseName: String
    var exerciseDescription: String
    var exerciseNumberOfRepetitions: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(15)
            VStack {
                Text (exerciseName)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                Rectangle ()
                    .fill (Color("Color"))
                    .frame(height: 1)
                
                Text(exerciseDescription)
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                
                Rectangle ()
                    .fill (Color("Color"))
                    .frame(height: 1)
                HStack {
                    Text("Повторений:")
                        .padding(5)
                    
                    Text(exerciseNumberOfRepetitions)
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity)
                        .padding(5)
                }
            }
        }
        .padding(5)
    }
}

struct ExerciseRow_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRow(exerciseName: "подтягивания", exerciseDescription: "с весом", exerciseNumberOfRepetitions: "4")
    }
}



    
