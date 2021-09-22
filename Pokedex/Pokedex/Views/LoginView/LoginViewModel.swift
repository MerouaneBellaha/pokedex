//
//  LoginViewModel.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 13/09/2021.
//

import Foundation

enum LoginAction {
    case signIn, signUp
}

enum LoginViewState {
    case signIn, signUp
}

class LoginViewModel: ObservableObject {
    
    @Published var loginData: LoginData = LoginData()    
    
    var viewStateModel: LoginViewStateModel = LoginViewStateModel()
    var viewState: LoginViewState
    var appState: AppState
    
    private let auth: AuthWrapperProtocol
    
    init(_ viewState: LoginViewState, state: AppState, auth: AuthWrapperProtocol = FirebaseAuthWrapper()) {
        self.viewState = viewState
        self.auth = auth
        self.appState = state
        setUp()
    }
    
    private func setUp() {
        switch viewState {
        case .signIn: viewStateModel = LoginViewStateModel(buttonAction: .signIn, buttonTitle: "sign in", navigationTitle: "Welcome !")
        case .signUp: viewStateModel = LoginViewStateModel(buttonAction: .signUp, buttonTitle: "sign up", navigationTitle: "Create account !")
        }
    }
    
    func send(_ action: LoginAction) {
        switch action {
        case .signIn: signIn()
        case .signUp: signUp()
        }
    }
    
    private func signIn() {
        auth.signIn(with: loginData) { result in
            switch result {
            case .failure(let error): print(error)
            case .success(_): self.appState.isSignedIn.toggle()
            }
        }
    }
    
    private func signUp() {
        auth.signUp(with: loginData) { result in
            switch result {
            case .failure(let error): print(error)
            case .success(_): self.appState.isSignedIn.toggle()
            }
        }
    }
}

struct LoginData {
    var email: String = ""
    var password: String = ""
}

struct LoginViewStateModel {
    var buttonAction: LoginAction = .signIn
    var buttonTitle = ""
    var navigationTitle = ""
}
