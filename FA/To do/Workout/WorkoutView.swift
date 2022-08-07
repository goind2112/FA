//
//  Workout.swift
//  FA
//
//  Created by Даниил Мухсинятов on 08.06.2022.
//

//import SwiftUI
//
//struct WorkoutView: View {
//    @State var isEditing = false
//    @State private var presentCreateAWorkoutForm = false
//    @StateObject var items: CreateAWorkoutViewModel
//    
//    var body: some View {
//        NavigationView {
//            List {
////                ForEach (WorkoutModelViewModel.shared.name, id: \.id) { item in
////                    ButtonWorkout(workoutModel: item)
////                }
////                .onDelete(perform: delete)
////                .onMove(perform: move)
//            }
//            .navigationBarTitle("Мои тренировки", displayMode:.inline)
//            .navigationBarItems(leading: Button(action: {
//                self.isEditing.toggle()
//            }) {
//                Text(isEditing ? "Занокнчить" : "Изменить")
//            }
//                .foregroundColor(.gray), trailing: Button(action: {
//                    let workout = WorkoutModel(name: items.createAWorkoutModel.name)
////                        workout.exerciseWorkoutModel = self.items.createAWorkoutModel.exerciseWorkoutModel
//                    DatabaseService.sharedDatabase.setWorkout(workout: workout) { result in
//                        switch result {
//                            
//                        case .success(let workout):
//                            print(workout.name)
//                        case .failure(let error):
//                            print(error.localizedDescription)
//                        }
//                    }
//                    presentCreateAWorkoutForm.toggle()
//                }, label: {
//                    Image (systemName: "plus")
//                        .foregroundColor(.gray)
//                }))
//            .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
//            
//        }
//        .fullScreenCover(isPresented: $presentCreateAWorkoutForm){ CreateAWorkout(items: CreateAWorkoutViewModel(createAWorkoutModel: WorkoutModel(id: "", name: "", exerciseWorkoutModel: [])), exerciseCreateAWorkout: ExerciseViewModel(exerciseCreateAWorkout: Exercise(id: 0, exerciseDescription: "", exerciseName: "", exerciseNumberOfRepetitions: "", usreID: ""), exerciseExample: Exercise(id: 0, exerciseDescription: "", exerciseName: "", exerciseNumberOfRepetitions: "", usreID: "")))
//        }
//    }
////    func delete (at offsets: IndexSet){
////        WorkoutModelViewModel.shared.name.remove(atOffsets: offsets)
////    }
////    func move (from source: IndexSet, to destination: Int){
////        WorkoutModelViewModel.shared.name.move(fromOffsets: source, toOffset: destination)
////    }
//}
//
//struct Workout_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutView(items: CreateAWorkoutViewModel(createAWorkoutModel: WorkoutModel(id: "", name: "", exerciseWorkoutModel: [])))
//    }
//}
//
