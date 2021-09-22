//
//  LogoutButton.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 22/09/2021.
//

import SwiftUI

struct LogoutButton: View {
    
    var auth: AuthWrapperProtocol
    @EnvironmentObject var appState: AppState
    
    init(auth: AuthWrapperProtocol = FirebaseAuthWrapper()) {
        self.auth = auth
    }
    
    var body: some View {
        Button(action: {
            auth.signout { result in
                switch result {
                case .success(_): appState.isSignedIn.toggle()
                case .failure(_): print("cant signout")
                }
            }
        }, label: {
            Text("log out")
        })
    }
}

struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButton()
    }
}
