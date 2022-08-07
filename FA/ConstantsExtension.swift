//
//  Constants.swift
//  FA
//
//  Created by Даниил Мухсинятов on 27.06.2022.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.sharedAuth.currentUser!)


extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}


struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move (to: CGPoint (x: rect.width, y: rect.height/3))
            path.addLine (to: CGPoint (x: rect.width, y: rect.height))
            path.addLine(to: CGPoint (x: rect.minX, y: rect.height))
            path.addLine(to: CGPoint(x: rect.minX, y:rect.minY))
            
        }
    }
}

struct CShape1: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move (to: CGPoint (x: rect.minX , y: rect.height/3))
            path.addLine (to: CGPoint (x: rect.minX, y: rect.height))
            path.addLine(to: CGPoint (x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y:rect.minY))
        }
    }
}

enum degreeOfPhysicalActivity:String {case minimum = "Минимум/отсутствие",
                                           weakActivity =  "Слабая активность",
                                           averageActivity = "Средняя активность",
                                           highActivity = "Высокая активность",
                                           veryHighActivity = "Очень высокая активность"}


enum sex: String {
    case male = "Муж",
         woman = "Жен"
}


