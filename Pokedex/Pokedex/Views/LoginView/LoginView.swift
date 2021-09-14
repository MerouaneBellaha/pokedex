//
//  LoginView.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 13/09/2021.
//


//https://www.youtube.com/watch?v=vPCEIPL0U_k

import SwiftUI

struct LoginView: View {
    
    init() { setupStyle() }
    
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkRed.edgesIgnoringSafeArea(.all)
                VStack(spacing: 45) {
                        logo
                        loginFields
                }
                .navigationTitle("Welcome !")
            }
        }
    }
    
    private func setupStyle() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor:  UIColor(Color("AccentBlue"))]
           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("AccentBlue"))]
    }
}

extension LoginView {
    private var logo: some View {
        Image("PokeballLogo")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
    }
    
    private var loginFields: some View {
        VStack(spacing: 16) {
            TextField("email adress",
                      text: $vm.loginData.email)
                .loginFieldStyle()
            SecureField("password",
                        text: $vm.loginData.password)
                .loginFieldStyle()
            submitButton
        }
        .padding()
    }
    
    private var submitButton: some View {
        Button(action: {}, label: {
            Text("Sign in")
                .frame(width: 200, height: 50)
                .background(Color.accentBlue)
                .cornerRadius(8)
                .foregroundColor(.white)
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
    }
}
