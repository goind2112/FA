
//  Workout.swift
//  FA
//
//  Created by Даниил Мухсинятов on 08.06.2022.


import SwiftUI

struct WorkoutView: View {
    @EnvironmentObject var realmServiceExercise: RealmServiceExercise
    @EnvironmentObject var realmServiceWorkout: RealmServiceWorkout
    @State private var isPresentedAllWorkout = false
    
    var body: some View {
            VStack{
                HStack {
                    Text ("Мои тренировки")
                        .font(.title).bold()
                        .padding()
                    Spacer()
                    Button {
                        isPresentedAllWorkout = true
                    }label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .padding()
                            .foregroundColor(.gray)
                    }
                }
                List {
                    ForEach(realmServiceWorkout.workoutArray, id: \.id) { workout in
                        if !workout.isInvalidated {
                            ButtonWorkout(name: workout.name)
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        realmServiceExercise.deleteAllExerciseToWorkoute(workoutId: workout.id)
                                        realmServiceWorkout.deleteWorkout(id: workout.id)
                                        
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                }
                    .listRowSeparator(.hidden)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.offWhite)
        .onAppear{
            UITableView.appearance().backgroundColor = UIColor.clear
            UITableViewCell.appearance().backgroundColor = UIColor.clear
            realmServiceWorkout.getWorkout()
            print("---\(realmServiceWorkout.workoutArray.count)____________")
        }
        .sheet(isPresented: $isPresentedAllWorkout) {
            addWorkout()
                .environmentObject(RealmServiceWorkout.shared)
                .environmentObject(RealmServiceExercise.shared)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.offWhite)
    }
    
    struct Workout_Previews: PreviewProvider {
        static var previews: some View {
            WorkoutView()
                .environmentObject(RealmServiceWorkout.shared)
                .environmentObject(RealmServiceExercise.shared)
        }
    }
}

