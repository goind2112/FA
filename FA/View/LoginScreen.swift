//
//  ContentView.swift
//  fitnessAssistant
//
//  Created by Даниил Мухсинятов on 04.06.2022.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct LoginScreen: View {
    
    @State var index = 0
    
    var body: some View {
        GeometryReader { _ in
            VStack() {
                ZStack {
                    Singup(index: self.$index)
                        .zIndex(Double(self.index))
                    Image ("Logo")
                        .resizable()
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                        .frame (width: 50, height: 50)
                        .padding(.bottom, 350)
                    Login(index: self.$index)
                }
                // To do:
                //                HStack(spacing: 15) {
                //                    Rectangle ()
                //                        .fill (Color("Color"))
                //                        .frame(height: 1)
                //                    Text("OR")
                //                    Rectangle ()
                //                        .fill (Color("Color"))
                //                        .frame(height: 1)
                //                        .border(.red)
                //                }
                //                .padding(.horizontal, 20)
                //                .padding(.top, 50)
                //                // Альтернативная регистрация (вход)
                //                HStack (spacing: 25)
                //                {
                //                    Button(action: {
                //                        //
                //                    }) {
                //                        Image ("Appel")
                //                            .resizable()
                //                            .renderingMode(.original)
                //                            .frame(width: 45, height: 45)
                //                            .clipShape(Circle())
                //                    }
                //                    Button(action: {
                //                        //
                //                    }) {
                //                        Image ("Vk")
                //                            .resizable()
                //                            .renderingMode(.original)
                //                            .frame(width: 45, height: 45)
                //                            .clipShape(Circle())
                //                    }
                //                    Button(action: {
                //                        //
                //                    }) {
                //                        Image ("Google")
                //                            .resizable()
                //                            .renderingMode(.original)
                //                            .frame(width: 45, height: 45)
                //                            .clipShape(Circle())
                //                    }
                //                }
                //                .padding(.top)
            }
        }
        .padding()
        .background(Color.offWhite)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginScreen()
                .previewInterfaceOrientation(.portrait)
        }
    }
}

struct Login: View {
    @State private var email = ""
    @State private var pass = ""
    @Binding var index : Int
    @State var isMainTabViewShow = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @State private var openPassword = true
    @State var alertMessage = ""
    @State var alert = false
    var body: some View {
        ZStack (alignment: .bottom) {
            VStack {
                HStack {
                    VStack (spacing: 10) {
                        Text ("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule ()
                            .fill(self.index == 0 ? .red : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer()
                    
                }.padding(.top, 30)
                VStack {
                    HStack(spacing: 15) {
                        Image (systemName: "envelope.fill")
                            .foregroundColor(.white)
                        TextField("Email Address", text: self.$email)
                            .frame(height: 15)
                            .padding(5)
                        
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                    .padding(.top, 40)
                VStack {
                    HStack(spacing: 15) {
                        Button {
                            openPassword.toggle()
                        } label: {
                            Image (systemName: "eye.slash.fill")
                                .foregroundColor(.white)
                        }
                        if openPassword {
                            SecureField("Password", text: self.$pass)
                                .frame(height: 15)
                                .padding(5)
                        } else {
                            TextField("Password", text: self.$pass)
                                .frame(height: 15)
                                .padding(5)
                        }
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                    .padding(.top, 30)
                // to do:
                // забыли пароль ?
                HStack {
                    Spacer(minLength: 0)
                    Button(action: {
                        //
                    }){
                        Text("")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }.padding(.horizontal)
                    .padding(.top, 30)
            } .padding()
                .padding(.bottom, 65)
                .background(Color ("Color"))
                .clipShape(CShape())
                .contentShape(CShape())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .onTapGesture {
                    self.index = 0
                }
                .cornerRadius(35)
            
            Button(action: {
                
                AuthService.sharedAuth.singIn(email: self.email,
                                              password: self.pass) { result in
                    switch result {
                        
                    case .success(_):
                        UserDefaults.standard.set(true, forKey: "status")
                        self.isMainTabViewShow.toggle()
                    case .failure(let error):
                        alertMessage = "Oшибка авторизации \(error.localizedDescription)"
                        self.alert.toggle()
                    }
                }
                
            }) {
                Text("ВОЙТИ")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(.white)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y:35)
            .opacity(self.index == 0 ? 1 : 0)
            .alert(isPresented: $alert) {
                
                Alert(title: Text("Alert"), message: Text(self.alertMessage), dismissButton: .default(Text("Ok")))
            }
        }
        .fullScreenCover(isPresented: $isMainTabViewShow) {
            MainTadView(viewModelUser: AccauntViewSettingsViewModel.init(profileUser: UserDB.init(id: "", nameUser: "", adgeUser: "", theWeightUesr: "", growthUser: "", physicalActivityUser: degreeOfPhysicalActivity.minimum.rawValue, genderUser: sex.male.rawValue)), calorieCalculatorModel: СalorieCalculatorViewModel(calorieCalculatorModel: CalorieCalculatorModel(adgeCalculator: "", theWeightCalculator: "", growthCalculator: "",genderCalculator: "", physicalActivityCalculator: "")), viewModel: mainTabBarViewModel)
        }
    }
}

struct Singup: View {
    @State private var email = ""
    @State private var pass = ""
    @State private var repass = ""
    @State private var openPass = true
    @State private var openRepass = true
    @State var message = ""
    @Binding var index : Int
    @State private var alert = false
    @State private var alertMessage = ""
    var body: some View {
        
        ZStack (alignment: .bottom) {
            VStack {
                HStack{
                    Spacer(minLength: 0)
                    
                    VStack (spacing: 10){
                        Text ("Singup")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)
                
                VStack {
                    HStack (spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.white)
                        TextField("Email Address",text: self.$email)
                            .frame(height: 15)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    HStack(spacing: 15){
                        Button {
                            openPass.toggle()
                        } label: {
                            Image(systemName: "eye.slash.fill")
                                .foregroundColor(.white)
                        }
                        if openPass { SecureField("Password", text: self.$pass)
                                .frame(height: 15)
                                .padding(5)
                        } else {
                            TextField("Password", text: self.$pass)
                                .frame(height: 15)
                                .padding(5)
                        }
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                } .padding(.horizontal)
                    .padding(.top, 30)
                
                VStack {
                    HStack (spacing: 15) {
                        Button {
                            openRepass.toggle()
                        } label: {
                            Image(systemName: "eye.slash.fill")
                                .foregroundColor(.white)
                        }
                        if openRepass {
                            SecureField("Password", text: self.$repass)
                                .frame(height: 15)
                                .padding(5)
                        } else {
                            TextField("Password", text: self.$repass)
                                .frame(height: 15)
                                .padding(5)
                        }
                    }
                    Divider().background(Color.white.opacity(0.5))
                } .padding(.horizontal)
                    .padding(.top, 30)
            } .padding()
                .padding(.bottom, 65)
                .background(Color("Color"))
                .clipShape(CShape1())
                .contentShape(CShape1())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .onTapGesture {
                    self.index = 1
                }
                .cornerRadius(35)
            Button(action: {
                guard pass == repass else {
                    self.alertMessage = "Ошибка регистрации Passwords do not match"
                    self.alert.toggle()
                    return
                }
                
                AuthService.sharedAuth.singUp(email: self.email,
                                              password: self.pass) { result in
                    switch result {
                        
                    case .success(let user):
                        alertMessage = "Вы зарегистрировались с email \"\(user.email!)\""
                        self.alert.toggle()
                        self.index = 0
                        self.email = ""
                        self.pass = ""
                        self.repass = ""
                        
                    case .failure(let error):
                        alertMessage = "Ошибка регистрации \(error.localizedDescription)!"
                        self.alert.toggle()
                        UserDefaults.standard.set(true, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }
                }
            }){
                Text ("SINGUP")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(.white)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: -5)
            }
            .offset(y: 35)
            .opacity(self.index == 1 ? 1 : 0)
            .alert(isPresented: $alert) {
                
                Alert(title: Text("Alert"), message: Text("\(alertMessage)"), dismissButton: .default(Text("Ok")))
            }
            
        }
    }
}

