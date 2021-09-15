//
//  FireBaseAuthWrapper.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 14/09/2021.
//

import Foundation
import FirebaseAuth

protocol AuthWrapperProtocol {
    func signIn(with loginData: LoginData, completion: @escaping (Result<Bool, Error>) -> ())
    func signUp(with loginData: LoginData, completion: @escaping (Result<Bool, Error>) -> ())
}

struct FirebaseAuthWrapper: AuthWrapperProtocol {
    
    let auth = Auth.auth()
    var isSignedIn: Bool { auth.currentUser.isDefined }
    
    func signIn(with loginData: LoginData, completion: @escaping (Result<Bool, Error>) -> ()) {
        auth.signIn(withEmail: loginData.email, password: loginData.password) { result, error in
            guard result.isDefined, error.isNotDefined else { return completion(.failure(error!)) }
            completion(.success(true))
        }
    }
    
    func signUp(with loginData: LoginData, completion: @escaping (Result<Bool, Error>) -> ()) {
        auth.createUser(withEmail: loginData.email, password: loginData.password) { result, error in
            guard result.isDefined, error.isNotDefined else { return completion(.failure(error!)) }
            completion(.success(true))
        }
    }
}
