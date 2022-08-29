//
//  Accaunt.swift
//  FA
//
//  Created by Даниил Мухсинятов on 08.06.2022.
//

import SwiftUI

struct AccauntView: View {
    @State private var settingsOpen = false
    @State private var userDataOpen = false
    @State private var physicalActivityOpen = false
    @ObservedObject var viewModelUser: AccauntViewSettingsViewModel
    @State private var showUserDataTooltip = false
    @State var calorieWeightRetention = 0
    @State var calorieManagerLoss = 0
    @State var calorieManagerFastLoss = 0
    let alertMassageUserDataTooltip = "Для внесения изменений в \"Данные пользователья\" зайдите в настройки"
    var body: some View {
        
        VStack {
           
            HStack {
                Button  {
                    settingsOpen.toggle()
                } label: {
                    Image (systemName: "gearshape.fill")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:25,height:25)
                        .foregroundColor(Color.gray)
                    
                    Text ("Настройки")
                        .font(.system(size: 19))
                        .padding(.trailing)
                        .foregroundColor(Color.gray)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            .padding()
            ScrollView (.vertical, showsIndicators: false) {
                
                VStack {Image (systemName: "person.fill")
                        .resizable()
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(30)
                        .frame(width: 170, height: 170)
                    Text ("\(viewModelUser.profileUser.nameUser)")
                        .font(.title)
                    
                }
                .padding(.vertical)
                
                VStack {
                    HStack {
                        Text ("Данные пользователя")
                            .font(.title)
                        Button {
                            showUserDataTooltip.toggle()
                        } label: {
                            Image (systemName: "questionmark.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.gray)
                                .alert(alertMassageUserDataTooltip, isPresented: $showUserDataTooltip) {
                                    Button { } label:
                                    {
                                        Text ("Ok")
                                    }
                                    
                                }
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    
                   
                    HStack {
                        Text ("Возраст:")
                            .font(.system(size: 20))
                        Text ("\(viewModelUser.profileUser.adgeUser)")
                            .font(.system(size: 20))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    
                    HStack {
                        Text ("Пол:")
                            .font(.system(size: 20))
                        Text ("\(viewModelUser.profileUser.genderUser)")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                   
                    HStack {
                        Text ("Вес:")
                            .font(.system(size: 20))
                        Text ("\(viewModelUser.profileUser.theWeightUesr)")
                            .font(.system(size: 20))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    
                    HStack {
                        Text ("Рост:")
                            .font(.system(size: 20))
                        Text ("\(viewModelUser.profileUser.growthUser)")
                            .font(.system(size: 20))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    VStack {
                        Text ("Физическая активность:")
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(5)
                        Text ("\(viewModelUser.profileUser.physicalActivityUser)")
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(5)
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
                .padding()
                // to do: Цель
//                VStack {
//                    Text ("Установи себе цель !")
//                        .font(.system(size: 25))
//                        .padding(5)
//                    Text ("Установи для себя цель по снижению веса, и достигни её.")
//                    Button(action: {
//                        //
//                    }) {
//                        Text("Создать цель")
//                            .foregroundColor(.gray)
//                            .fontWeight(.bold)
//                            .padding(.vertical)
//                            .padding(.horizontal, 50)
//                            .background(.white)
//                            .clipShape(Capsule())
//                    }
//                    .padding()
//                }
//                .frame(maxWidth: .infinity)
//                .background(Color.blue)
//                .cornerRadius(35)
//                .padding()
            }
        }
        .background(Color.offWhite)
        .onAppear{

            calorieWeightRetention = viewModelUser.calorieManagerWeightRetention(adgeCalculator: viewModelUser.profileUser.adgeUser, theWeightCalculator: viewModelUser.profileUser.theWeightUesr, growthCalculator: viewModelUser.profileUser.growthUser, physicalActivityCalculator: viewModelUser.profileUser.physicalActivityUser, genderCalculator: viewModelUser.profileUser.genderUser)

            calorieManagerLoss = viewModelUser.calorieManagerWeightLoss(adgeCalculator: viewModelUser.profileUser.adgeUser, theWeightCalculator: viewModelUser.profileUser.theWeightUesr, growthCalculator: viewModelUser.profileUser.growthUser, physicalActivityCalculator: viewModelUser.profileUser.physicalActivityUser, genderCalculator: viewModelUser.profileUser.genderUser)

           calorieManagerFastLoss = viewModelUser.calorieManagerFastWeightLoss(adgeCalculator: viewModelUser.profileUser.adgeUser, theWeightCalculator: viewModelUser.profileUser.theWeightUesr, growthCalculator: viewModelUser.profileUser.growthUser, physicalActivityCalculator: viewModelUser.profileUser.physicalActivityUser, genderCalculator: viewModelUser.profileUser.genderUser)
        }
        .fullScreenCover(isPresented: $settingsOpen) {
            Settings(viewModelUser: AccauntViewSettingsViewModel.init(profileUser: UserDB(id: "", nameUser: "", adgeUser: "", theWeightUesr: "", growthUser: "", physicalActivityUser: degreeOfPhysicalActivity.minimum.rawValue, genderUser: sex.male.rawValue)))
            
        }
    }
}





