//
//  Settings.swift
//  FA
//
//  Created by Даниил Мухсинятов on 14.06.2022.
//

import SwiftUI




struct Settings: View {
    
    @State var tabViewBack = false
    @State var infoListPresent = false
    @State var showLoginScreen = false
    @ObservedObject var viewModelUser: AccauntViewSettingsViewModel
    @State var sexСhange = UserDefaults.standard.value(forKey: "statusSexСhange")
    @State var physicalActivity: degreeOfPhysicalActivity =  .minimum
    var body: some View {
        VStack {
            Button {
                tabViewBack.toggle()
            } label: {
                HStack {
                    Text ("Назад")
                        .foregroundColor(.gray)
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        showLoginScreen.toggle()
                        UserDefaults.standard.set(false, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    } label: {
                        Text ("Выйти")
                            .foregroundColor(.gray)
                            .font(.title2)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(5)
            ScrollView {
                VStack {
                    Button  {
                        //
                    } label: {
                        Image (systemName: "person.fill")
                            .resizable()
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.black)
                            .cornerRadius(30)
                            .frame(width: 170, height: 170)
                    }
                    TextField(" \(viewModelUser.profileUser.nameUser)", text: self.$viewModelUser.profileUser.nameUser)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(5)
                        .background()
                        .cornerRadius(15)
                    // Данные пользователяsd
                    VStack {
                        HStack {
                            Text ("Данные пользователя")
                                .font(.title)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        //Возраст
                        HStack {
                            Text ("Возраст:")
                                .font(.system(size: 20))
                            TextField (" \(viewModelUser.profileUser.adgeUser) лет", text: self.$viewModelUser.profileUser.adgeUser)
                                .font(.system(size: 20))
                                .padding(5)
                                .background()
                                .cornerRadius(12)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        //Пол
                        HStack {
                            Text ("Пол")
                                .font(.system(size: 20))
                            Button  {
                                self.sexСhange = 1
                                viewModelUser.profileUser.genderUser = sex.male.rawValue
                                UserDefaults.standard.set(1, forKey: "statusSexСhange")
                            } label: {
                                Image (systemName: "circle.fill")
                                    .foregroundColor(self.sexСhange as? Int == 1 ? .blue: .gray)
                                Text ("Муж")
                                    .foregroundColor(self.sexСhange as? Int == 1 ? .black: .gray)
                            }
                            Button  {
                                self.sexСhange = 2
                                viewModelUser.profileUser.genderUser = sex.woman.rawValue
                                UserDefaults.standard.set(2, forKey: "statusSexСhange")
                            } label: {
                                Image (systemName: "circle.fill")
                                    .foregroundColor(self.sexСhange as? Int == 2 ? .blue: .gray)
                                Text ("Жен")
                                    .foregroundColor(self.sexСhange as? Int == 2 ? .black: .gray)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        //Вес
                        HStack {
                            Text ("Вес:")
                                .font(.system(size: 20))
                            TextField (" \(viewModelUser.profileUser.theWeightUesr) кг", text: self.$viewModelUser.profileUser.theWeightUesr)
                                .font(.system(size: 20))
                                .padding(5)
                                .background()
                                .cornerRadius(12)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        //Рост
                        HStack {
                            Text ("Рост:")
                                .font(.system(size: 20))
                            TextField (" \(viewModelUser.profileUser.growthUser) см", text: self.$viewModelUser.profileUser.growthUser)
                                .font(.system(size: 20))
                                .padding(5)
                                .background()
                                .cornerRadius(12)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        VStack {
                            HStack{
                                Text ("Физическая активность:")
                                    .font(.system(size: 20))
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
                            Picker ("degreeOfPhysicalActivity", selection: $viewModelUser.profileUser.physicalActivityUser) {
                        
                                Text(degreeOfPhysicalActivity.minimum.rawValue).tag( degreeOfPhysicalActivity.minimum.rawValue)
                                    
                                    Text(degreeOfPhysicalActivity.weakActivity.rawValue).tag(degreeOfPhysicalActivity.weakActivity.rawValue)
                                    
                                    Text(degreeOfPhysicalActivity.averageActivity.rawValue).tag(degreeOfPhysicalActivity.averageActivity.rawValue)
                                    
                                    Text(degreeOfPhysicalActivity.highActivity.rawValue).tag(degreeOfPhysicalActivity.highActivity.rawValue)

                                    Text(degreeOfPhysicalActivity.veryHighActivity.rawValue).tag(degreeOfPhysicalActivity.veryHighActivity.rawValue)
                                }
                        } label: {
                            Label("\(viewModelUser.profileUser.physicalActivityUser)", systemImage: "person.crop.circle.badge.questionmark.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        
                        
                        
                        
                        
                        Button {
                            tabViewBack.toggle()
                            viewModelUser.setUserViewModel()
                        } label: {
                            Text ("Изменить")
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                                .padding(.vertical)
                                .padding(.horizontal, 50)
                                .background(.white)
                                .clipShape(Capsule())
                                .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                        }
                        
                    }
                    .padding()
                }
            }
        }
        .background(Color.offWhite)
        .fullScreenCover(isPresented: $tabViewBack){
            MainTadView(viewModelUser: AccauntViewSettingsViewModel.init(profileUser: UserDB.init(id: "", nameUser: "", adgeUser: "", theWeightUesr: "", growthUser: "", physicalActivityUser: degreeOfPhysicalActivity.minimum.rawValue, genderUser: sex.male.rawValue)), calorieCalculatorModel: СalorieCalculatorViewModel(calorieCalculatorModel: CalorieCalculatorModel(adgeCalculator: "", theWeightCalculator: "", growthCalculator: "",genderCalculator: "", physicalActivityCalculator: "")), viewModel: mainTabBarViewModel)
        }
        .fullScreenCover(isPresented: $infoListPresent) {
            InfoListPhysicalActivity()
        }
        .fullScreenCover(isPresented: $showLoginScreen) {
            LoginScreen()
        }
        .onAppear{
            self.viewModelUser.getUserViewModel()
        }
    }
}







struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(viewModelUser: AccauntViewSettingsViewModel(profileUser: UserDB(id: "", nameUser: "", adgeUser: "", theWeightUesr: "", growthUser: "", physicalActivityUser: degreeOfPhysicalActivity.minimum.rawValue, genderUser: sex.male.rawValue)))
    }
}


