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
    private let auth: AuthWrapperProtocol
    
    init(auth: AuthWrapperProtocol = FirebaseAuthWrapper()) {
        self.auth = auth
    }
    
    func send(_ action: Action) {
        switch action {
        case .signIn: auth.signIn(with: loginData)
        case .signUp: auth.signUp(with: loginData)
        }
    }
}

struct LoginData {
    var email: String = ""
    var password: String = ""
}
