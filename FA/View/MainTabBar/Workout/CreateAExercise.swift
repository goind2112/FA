//
//  SwiftUIView.swift
//  FA
//
//  Created by Даниил Мухсинятов on 02.08.2022.
//

import SwiftUI
import IQKeyboardManagerSwift

struct CreateAExercise: View {
    
    @Binding var showsCreateAExercise: Bool
    @EnvironmentObject var realmServiceExercise: RealmServiceExercise
    @EnvironmentObject var realmServiceWorkout: RealmServiceWorkout
    @State private var exerciseName = ""
    @State private var exerciseDescription = ""
    @State private var exerciseNumberOfRepetitions = ""
    @FocusState var focused: Bool
    
    var body: some View {
        List {
            Section {
                Section {
                    Button {
                        focused = false
                        showsCreateAExercise = false
                        exerciseName = ""
                        exerciseDescription = ""
                        exerciseNumberOfRepetitions = ""
                        
                    } label: {
                        Text ("Закрыть")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .listRowSeparator(.hidden)
                Section {
                    
                    TextField ("Название упражнения", text: $exerciseName)
                        .font(.system(size: 20))
                        .padding(5)
                        .background(.white)
                        .cornerRadius(12)
                        .focused($focused)
                    Text("Описание тренеровки:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                    
                    TextEditor (text: $exerciseDescription)
                        .font(.system(size: 20))
                        .padding(5)
                        .frame(height: 100)
                        .background(.white)
                        .cornerRadius(12)
                        .focused($focused)

                    
                    TextField ("Количество повторений", text: $exerciseNumberOfRepetitions)
                        .font(.system(size: 20))
                        .padding(5)
                        .background(.white)
                        .cornerRadius(12)
                        .focused($focused)
                }
                .listRowSeparator(.hidden)
                Section {
                    Button {
                        focused = false
                        showsCreateAExercise = false
                        realmServiceExercise.addExercise(exerciseName: exerciseName, exerciseDescription: exerciseDescription, exerciseNumberOfRepetitions: exerciseNumberOfRepetitions, workoutId: realmServiceWorkout.workoutId)
                        exerciseName = ""
                        exerciseDescription = ""
                        exerciseNumberOfRepetitions = ""
                    } label: {
                        Text("Сохранить")
                            .frame(alignment: .leading)
                            .padding(5)
                            .foregroundColor(.gray)
                            .background(.white)
                            .cornerRadius(12)
                    }
                }
                .listRowSeparator(.hidden)
            }
        }
    }
}
