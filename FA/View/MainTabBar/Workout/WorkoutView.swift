
//  Workout.swift
//  FA
//
//  Created by Даниил Мухсинятов on 08.06.2022.


import SwiftUI

struct WorkoutView: View {
    @EnvironmentObject var realmServiceExercise: RealmServiceExercise
    @EnvironmentObject var realmServiceWorkout: RealmServiceWorkout
    @State private var isPresentedAllWorkout = false
    @State private var showCreateWorkout = false
    
    var body: some View {
        VStack {
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
            HStack {
                List {
                    ForEach(realmServiceWorkout.workoutArray, id: \.id) { workout in
                        if !workout.isInvalidated {
                            ZStack {
                                Rectangle()
                                    .fill(Color.white)
                                    .cornerRadius(15)
                                WorkoutRow(name: workout.name)
                            }
                            
                            .fullScreenCover(isPresented: $showCreateWorkout) {
                                CreateAWorkout().environmentObject(RealmServiceExercise.shared)
                            }
                            .onTapGesture(perform: {
                                showCreateWorkout.toggle()
                                realmServiceWorkout.workoutTransferId(name: workout.id)
                            })
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
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear{
            realmServiceWorkout.getWorkout()
        }
        .sheet(isPresented: $isPresentedAllWorkout) {
            AddWorkout()
                .environmentObject(RealmServiceWorkout.shared)
                .environmentObject(RealmServiceExercise.shared)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.offWhite)
    }
    
    struct WorkoutView_Previews: PreviewProvider {
        static var previews: some View {
            WorkoutView()
                .environmentObject(RealmServiceWorkout.shared)
                .environmentObject(RealmServiceExercise.shared)
        }
    }
}

