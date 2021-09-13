//
//  LoginViewModel.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 13/09/2021.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var loginData: LoginData = LoginData()
    
}

struct LoginData {
    var email: String = ""
    var password: String = ""
}
