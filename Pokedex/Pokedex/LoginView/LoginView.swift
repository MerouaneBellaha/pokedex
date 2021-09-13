//
//  LoginView.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 13/09/2021.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                logo
                loginFields
                Spacer()
            }
            .navigationTitle("Sign in")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    private var logo: some View {
        Image("")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .background(Color(.gray))
    }
    
    private var loginFields: some View {
        VStack {
            TextField("email adress",
                      text: $vm.loginData.email)
                .padding()
                .background(Color.gray)
                .cornerRadius(8)
            SecureField("password",
                        text: $vm.loginData.password)
                .padding()
                .background(Color.gray)
                .cornerRadius(8)
            submitButton
        }
        .padding()
    }
    
    private var submitButton: some View {
        Button(action: {}, label: {
            Text("Sign in")
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .cornerRadius(8)
                .foregroundColor(.white)
        })
    }
}
