//
//  AppState.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 15/09/2021.
//

import Foundation

class AppState: ObservableObject {
    @Published var isSignedIn = FirebaseAuthWrapper().isSignedIn
}
