//
//  FAApp.swift
//  FA
//
//  Created by Даниил Мухсинятов on 05.06.2022.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

let screen = UIScreen.main.bounds

@main
struct FAApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            LoginScreen()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate{
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            return true
        }
    }
    
}
