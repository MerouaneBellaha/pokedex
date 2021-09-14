//
//  FireBaseAuthWrapper.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 14/09/2021.
//

import Foundation

protocol AuthWrapperProtocol {
    func signIn(with loginData: LoginData)
    func signUp(with loginDate: LoginData)
}

struct FirebaseAuthWrapper: AuthWrapperProtocol {
    func signIn(with loginData: LoginData) {
        //
    }
    
    func signUp(with loginDate: LoginData) {
        //
    }
}
