//
//  СalorieCalculatorView.swift
//  FA
//
//  Created by Даниил Мухсинятов on 08.06.2022.
//

import SwiftUI

struct CalorieCalculatorView: View {
    @State var infoListPresent = false
    @ObservedObject var viewСalorieCalculatorViewModel: СalorieCalculatorViewModel
    @State var physicalActivity: degreeOfPhysicalActivity = .minimum
    @State var sex = ""
    @State var adgeCalculator = ""
    @State var theWeightCalculator = ""
    @State var growthCalculator = ""
    @State var sexСhange = 0
    @State var calorieWeightRetention = 0
    @State var calorieManagerLoss = 0
    @State var calorieManagerFastLoss = 0
    
    var body: some View {
        VStack {
            Text ("Калькулятор калорий")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(5)
                .padding(.vertical, 15)
            Spacer()
            ScrollView{
                VStack {
                    
                    HStack {
                        Text ("Возраст:")
                            .font(.title2)
                        TextField ("лет", text: self.$adgeCalculator)
                            .font(.title2)
                            .padding(5)
                            .background()
                            .cornerRadius(12)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    
                    HStack {
                        Text ("Пол")
                            .font(.system(size: 20))
                        Button  {
                            self.sexСhange = 1
                            sex = "Муж"
                        } label: {
                            Image (systemName: "circle.fill")
                                .foregroundColor(self.sexСhange as Int == 1 ? .blue: .gray)
                            Text ("Муж")
                                .foregroundColor(self.sexСhange as Int == 1 ? .black: .gray)
                        }
                        Button  {
                            self.sexСhange = 2
                            sex = "Жен"
                        } label: {
                            Image (systemName: "circle.fill")
                                .foregroundColor(self.sexСhange as Int == 2 ? .blue: .gray)
                            Text ("Жен")
                                .foregroundColor(self.sexСhange as Int == 2 ? .black: .gray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    
                    HStack {
                        Text ("Вес:")
                            .font(.title2)
                        TextField (" кг", text: self.$theWeightCalculator)
                            .font(.title2)
                            .padding(5)
                            .background()
                            .cornerRadius(12)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    
                    HStack {
                        Text ("Рост:")
                            .font(.title2)
                        TextField ("см", text: self.$growthCalculator)
                            .font(.title2)
                            .padding(5)
                            .background()
                            .cornerRadius(12)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    VStack {
                        HStack{
                            Text ("Физическая активность:")
                                .font(.title2)
                            Button {
                                infoListPresent.toggle()
                            } label: {
                                Image (systemName: "questionmark.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    Menu {
                        Picker ("degreeOfPhysicalActivity", selection: $physicalActivity) {
                            
                            Text(degreeOfPhysicalActivity.minimum.rawValue).tag(degreeOfPhysicalActivity.minimum)
                            
                            Text(degreeOfPhysicalActivity.weakActivity.rawValue).tag(degreeOfPhysicalActivity.weakActivity)
                            
                            Text(degreeOfPhysicalActivity.averageActivity.rawValue).tag(degreeOfPhysicalActivity.averageActivity)
                            
                            Text(degreeOfPhysicalActivity.highActivity.rawValue).tag(degreeOfPhysicalActivity.highActivity)
                            
                            Text(degreeOfPhysicalActivity.veryHighActivity.rawValue).tag(degreeOfPhysicalActivity.veryHighActivity)
                        }
                    } label: {
                        Label("\(physicalActivity.rawValue)", systemImage: "person.crop.circle.badge.questionmark.fill")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    
                    
                    Button {
                        calorieWeightRetention = viewСalorieCalculatorViewModel.calorieManagerWeightRetention(adgeCalculator: adgeCalculator, theWeightCalculator: theWeightCalculator, growthCalculator: growthCalculator, physicalActivityCalculator: physicalActivity.rawValue, genderCalculator: sex)
                        
                        calorieManagerLoss = viewСalorieCalculatorViewModel.calorieManagerWeightLoss(adgeCalculator: adgeCalculator, theWeightCalculator: theWeightCalculator, growthCalculator: growthCalculator, physicalActivityCalculator: physicalActivity.rawValue, genderCalculator: sex)
                        
                        calorieManagerFastLoss = viewСalorieCalculatorViewModel.calorieManagerFastWeightLoss(adgeCalculator: adgeCalculator, theWeightCalculator: theWeightCalculator, growthCalculator: growthCalculator, physicalActivityCalculator: physicalActivity.rawValue, genderCalculator: sex)
                    } label: {
                        Text ("Расчитать")
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                            .background(.white)
                            .clipShape(Capsule())
                            .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                    }
                    VStack{
                        Text ("Потребление калорий для сохраниения веса:")
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(5)
                        Text ("\(calorieWeightRetention)")
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(5)
                            .background(.white)
                            .cornerRadius(15)
                    }
                    VStack{
                        Text ("Потребление калорий для похудения:")
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(5)
                        Text ("\(calorieManagerLoss)")
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(5)
                            .background(.white)
                            .cornerRadius(15)
                    }
                    VStack{
                        Text ("Потребление калорий для быстрого похудения:")
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(5)
                        Text ("\(calorieManagerFastLoss)")
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(5)
                            .background(.white)
                            .cornerRadius(15)
                    }
                }
                .padding(.vertical, 30)
                .padding(5)
                
            }
        }
        .background(Color.offWhite)
        .fullScreenCover(isPresented: $infoListPresent) {
            InfoListPhysicalActivity()
        }
    }
}

