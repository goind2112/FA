//
//  SwiftUIView.swift
//  FA
//
//  Created by Даниил Мухсинятов on 02.08.2022.
//

//import SwiftUI
//
//struct CreateAExercise: View {
//
//    @StateObject var items: CreateAWorkoutViewModel
//    @StateObject var exerciseCreateAWorkout: ExerciseViewModel
//    @Binding var showsCreateAExercise: Bool
//
//    var body: some View {
//        List {
//            VStack{
//            Button {
//                showsCreateAExercise = false
//            } label: {
//             Text ("Закрыть")
//                    .font(.title3)
//                    .foregroundColor(.gray)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
//
//            VStack {
//                Text("Упражнение:")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(5)
//
//                TextField ("Название упражнения", text: $exerciseCreateAWorkout.exerciseCreateAWorkout.exerciseName)
//                    .font(.system(size: 20))
//                    .padding(5)
//                    .background(.white)
//                    .cornerRadius(12)
//
//
//                Rectangle ()
//                    .fill (Color("Color"))
//                    .frame(height: 1)
//
//                Text("Описание тренеровки:")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(5)
//
//
//                TextEditor (text: $exerciseCreateAWorkout.exerciseCreateAWorkout.exerciseDescription)
//                    .font(.system(size: 20))
//                    .padding(5)
//                    .frame(height: 100)
//                    .background(.white)
//                    .cornerRadius(12)
//
//                Rectangle ()
//                    .fill (Color("Color"))
//                    .frame(height: 1)
//
//                Text("Повторений:")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(5)
//
//                TextField ("Количество повторений", text: $exerciseCreateAWorkout.exerciseCreateAWorkout.exerciseNumberOfRepetitions)
//                    .font(.system(size: 20))
//                    .padding(5)
//                    .background(.white)
//                    .cornerRadius(12)
//                Button {
//                    items.addExercise(Exercise(id: 0, exerciseDescription: exerciseCreateAWorkout.exerciseCreateAWorkout.exerciseDescription,
//                                               exerciseName: exerciseCreateAWorkout.exerciseCreateAWorkout.exerciseName,
//                                               exerciseNumberOfRepetitions: exerciseCreateAWorkout.exerciseCreateAWorkout.exerciseNumberOfRepetitions,
//                                               usreID: AuthService.sharedAuth.currentUser!.uid))
//
//                    exerciseCreateAWorkout.addExerciseExample(exercise: Exercise(id: 0, exerciseDescription: exerciseCreateAWorkout.exerciseCreateAWorkout.exerciseDescription,
//                                                          exerciseName: exerciseCreateAWorkout.exerciseCreateAWorkout.exerciseName,
//                                                          exerciseNumberOfRepetitions: exerciseCreateAWorkout.exerciseCreateAWorkout.exerciseNumberOfRepetitions,
//                                                          usreID: AuthService.sharedAuth.currentUser!.uid))
//                    showsCreateAExercise = false
//
//
//                } label: {
//                    Text("Сохранить")
//                        .frame(alignment: .leading)
//                        .padding(5)
//                        .foregroundColor(.gray)
//                        .background(.white)
//                        .cornerRadius(12)
//                }
//            }
//            }
//        }
//    }
//}

