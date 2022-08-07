//
//  UserViewModel.swift
//  FA
//
//  Created by Даниил Мухсинятов on 05.07.2022.
//

import Foundation
import Firebase

class MainTabBarViewModel: ObservableObject {
    @Published var user: User

    init(user: User) {
        self.user = user
    }
}

