//
//  LandingView.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 15/09/2021.
//

import SwiftUI

struct LandingView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        if appState.isSignedIn {
            Text("")
        } else {
            LoginView()
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView().environmentObject(AppState())
    }
}
