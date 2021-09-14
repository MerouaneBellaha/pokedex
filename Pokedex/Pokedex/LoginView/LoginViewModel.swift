//
//  LoginViewModel.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 13/09/2021.
//

import Foundation

enum Action {
    case signIn, signUp
}

class LoginViewModel: ObservableObject {
    
    @Published var loginData: LoginData = LoginData()
    
    var isSignedIn: Bool { true }
    
    func send(_ action: Action) {
        switch action {
        case .signIn: signIn(with: loginData)
        case .signUp: signUp(with: loginData)
        }
    }
    
    private func signIn(with loginData: LoginData) {
        
    }
    
    private func signUp(with loginData: LoginData) {
        
    }
    
}

struct LoginData {
    var email: String = ""
    var password: String = ""
}
