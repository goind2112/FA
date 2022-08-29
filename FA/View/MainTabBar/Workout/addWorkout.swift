//
//  addWorkout.swift
//  FA
//
//  Created by Даниил Мухсинятов on 11.08.2022.
//

import SwiftUI

struct addWorkout: View {
    
   @EnvironmentObject var realmServiceWorkout: RealmServiceWorkout
   @State private var name: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            
        Text("Создай тренировку")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Введите название тренировки", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
            
            Button {
                if name != "" {
                    realmServiceWorkout.addWorkout(name: name)
                }
                dismiss()
            } label: {
                Text ("Добавить тренировку")
                    .foregroundColor(.gray)
                    .font(.title3)
                    .padding(5)
                    .background(.white)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.9), radius: 6, x: 0, y: 0)
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color.offWhite)
    }
}

struct addWorkout_Previews: PreviewProvider {
    static var previews: some View {
        addWorkout()
            .environmentObject(RealmServiceWorkout.shared)
            .environmentObject(RealmServiceExercise.shared)
    }
}
