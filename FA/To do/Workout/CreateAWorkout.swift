//
//  N.swift
//  FA
//
//  Created by Даниил Мухсинятов on 26.06.2022.
//

//import SwiftUI
//import SpriteKit
//
//struct CreateAWorkout: View {
//    @State var isMainTabViewShow = false
//    @State var isEditing = false
//    @ObservedObject var items: CreateAWorkoutViewModel
//    @ObservedObject var exerciseCreateAWorkout: ExerciseViewModel
//    @State private var editMode = EditMode.inactive
//    @State var showsCreateAExercise = false
//    @Environment(\.presentationMode) var presentationMode
//    var body: some View {
//        NavigationView {
//            ZStack{
//            VStack {
//                TextField ("Название тренеровки", text: self.$items.createAWorkoutModel.name)
//                        .font(.title)
//                        .padding()
//                        .background(Color.offWhite)
//
//                    List{
//                        ForEach(items.createAWorkoutModel.exerciseWorkoutModel)
//                        {items in
//
//                            ExerciseCell(exerciseCreateAWorkout: ExerciseViewModel(exerciseCreateAWorkout: Exercise(id: 0, exerciseDescription: "", exerciseName: "", exerciseNumberOfRepetitions: "", usreID: ""), exerciseExample: Exercise(id: 0, exerciseDescription: "", exerciseName: "", exerciseNumberOfRepetitions: "", usreID: "")))
//                                .cornerRadius(12)
//                        }
//                        .onDelete(perform: onDelete)
//                                        .onMove(perform: onMove)
//
//                        } .listStyle(.sidebar)
//                    .navigationBarTitle("Создание тренировки", displayMode:.inline)
//                    .navigationBarItems(leading: Button(action: {
//                        self.isEditing.toggle()
//                    }) {
//                        Text(isEditing ? "Занокнчить" : "Изменить")
//                            .foregroundColor(.gray)
//                    }, trailing: Button(action: {
//                        showsCreateAExercise.toggle()
//                    }, label: {
//                        Image(systemName: "plus")  .foregroundColor(.gray)
//                    }))
//                    .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
//                HStack{
//                    Button {
//                        isMainTabViewShow.toggle()
//                    } label: {
//                        Text("Выход")
//                            .foregroundColor(.gray)
//                            .padding()
//
//                    }
//                    Spacer()
//
//                    Button {
//
//                     var workout = WorkoutModel(name: items.createAWorkoutModel.name)
//                        workout.exerciseWorkoutModel = self.items.createAWorkoutModel.exerciseWorkoutModel
//                       DatabaseService.sharedDatabase.setWorkout(workout: workout) { result in
//                            switch result {
//
//                           case .success(let workout):
//                               print(workout.name)
//                            case .failure(let error):
//                                print(error.localizedDescription)
//                            }
//                        }
//                    } label: {
//                    Text("Сохранить изменения")
//                        .foregroundColor(.gray)
//                        .padding()
//
//                }
//                }
//            }
//                CreateAExercise(items: CreateAWorkoutViewModel(createAWorkoutModel: WorkoutModel(id: "", name: "", exerciseWorkoutModel: [])), exerciseCreateAWorkout: ExerciseViewModel(exerciseCreateAWorkout: Exercise(id: 0, exerciseDescription: "", exerciseName: "", exerciseNumberOfRepetitions: "", usreID: ""), exerciseExample: Exercise(id: 0, exerciseDescription: "", exerciseName: "", exerciseNumberOfRepetitions: "", usreID: "")), showsCreateAExercise: $showsCreateAExercise)
//                    .offset(y: showsCreateAExercise ?  UIScreen.main.bounds.height / 4
//                            :
//                        UIScreen.main.bounds.height)
//                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
//            }
//            .background(Color.offWhite)
//            .onAppear {
//                DatabaseService.sharedDatabase.getCreateAWorkout(by: DatabaseService.sharedDatabase.workoutRef.collectionID) { result in
//                    switch result {
//
//                    case .success(let workout):
//                        print(workout.self)
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//                }
//                print("----------------or----------------")
//            }
//
//            .fullScreenCover(isPresented: $isMainTabViewShow) {
//                MainTadView(viewModelUser: AccauntViewSettingsViewModel.init(profileUser: UserDB.init(id: "", nameUser: "", adgeUser: "", theWeightUesr: "", growthUser: "", physicalActivityUser: degreeOfPhysicalActivity.minimum.rawValue, genderUser: sex.male.rawValue)), calorieCalculatorModel: СalorieCalculatorViewModel(calorieCalculatorModel: CalorieCalculatorModel(adgeCalculator: "", theWeightCalculator: "", growthCalculator: "",genderCalculator: "", physicalActivityCalculator: "")), viewModel: mainTabBarViewModel)
//            }
//        }
//    }
//
//    private var addButton: some View {
//        switch editMode {
//        case .inactive:
//            return AnyView(Button(action: onAdd) { Image(systemName: "plus")  .foregroundColor(.gray)})
//       default:
//           return AnyView(EmptyView())
//        }
//   }
//    private func onDelete(offsets: IndexSet) {
//        items.createAWorkoutModel.exerciseWorkoutModel.remove(atOffsets: offsets)
//    }
//
//    private func onMove(source: IndexSet, destination: Int) {
//        items.createAWorkoutModel.exerciseWorkoutModel.move(fromOffsets: source, toOffset: destination)
//    }
//    private func onAdd() {
//        items.createAWorkoutModel.exerciseWorkoutModel.append(Exercise(exerciseDescription: "", exerciseName: "", exerciseNumberOfRepetitions: "", usreID: AuthService.sharedAuth.currentUser!.uid))
//    }
//}
//
//
//struct N_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateAWorkout(items: CreateAWorkoutViewModel(createAWorkoutModel: WorkoutModel(id: "", name: "", exerciseWorkoutModel: [])), exerciseCreateAWorkout: ExerciseViewModel(exerciseCreateAWorkout: Exercise(id: 0, exerciseDescription: "", exerciseName: "", exerciseNumberOfRepetitions: "", usreID: ""), exerciseExample: Exercise(id: 0, exerciseDescription: "", exerciseName: "", exerciseNumberOfRepetitions: "", usreID: "")))
//    }
//}
