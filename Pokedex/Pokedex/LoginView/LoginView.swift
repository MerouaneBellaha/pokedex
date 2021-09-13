//
//  LoginView.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 13/09/2021.
//


//https://www.youtube.com/watch?v=vPCEIPL0U_k

import SwiftUI

struct LoginView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor:  UIColor(Color("AccentBlue"))]
           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("AccentBlue"))]
       }
    
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryRed").edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    logo
                    loginFields
                    Spacer()
                }
                .navigationTitle("Sign in")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
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
        VStack {
            TextField("email adress",
                      text: $vm.loginData.email)
                .fieldStyle()
            SecureField("password",
                        text: $vm.loginData.password)
                .fieldStyle()
            submitButton
        }
        .padding()
    }
    
    private var submitButton: some View {
        Button(action: {}, label: {
            Text("Sign in")
                .frame(width: 200, height: 50)
                .background(Color("AccentBlue"))
                .cornerRadius(8)
                .foregroundColor(.white)
        })
    }
}


struct Field: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color("DarkGreen"))
            .cornerRadius(8)
            .foregroundColor(.black)
    }
}

extension View {
    func fieldStyle() -> some View {
        self.modifier(Field())
    }
}
