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
    
    private let auth: AuthWrapperProtocol
    
    init(auth: AuthWrapperProtocol = FirebaseAuthWrapper()) {
        self.auth = auth
    }
    
    func send(_ action: Action) {
        switch action {
        case .signIn: signIn(with: loginData)
        case .signUp: signUp(with: loginData)
        }
    }
    
    private func signIn(with: LoginData) {
        auth.signIn(with: loginData) { result in
            switch result {
            case .failure(let error): print(error)
            case .success(_): print("signIn Success")
            }
        }
    }
    
    private func signUp(with: LoginData) {
        auth.signUp(with: loginData) { result in
            switch result {
            case .failure(let error): print(error)
            case .success(_): print("signUp Success")
            }
        }
    }
}

struct LoginData {
    var email: String = ""
    var password: String = ""
}
