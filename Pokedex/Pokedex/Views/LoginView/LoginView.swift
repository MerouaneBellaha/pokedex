//
//  LoginView.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 13/09/2021.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var vm: LoginViewModel
    @EnvironmentObject var appState: AppState

    init(_ viewModel: LoginViewModel) {
        self.vm = viewModel
        setupStyle()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkRed.edgesIgnoringSafeArea(.all)
                    VStack(spacing: 35) {
                            logo
                            loginFields
                            submitButton(
                                title: vm.viewStateModel.buttonTitle,
                                action: { vm.send(vm.viewStateModel.buttonAction) }
                            )
                        NavigationLink("Create account",
                                       destination: LoginView(LoginViewModel(.signUp, state: appState)))
                            .padding(.top, -30)
                    }
                    .navigationTitle(vm.viewStateModel.navigationTitle)
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
                .loginFieldSetUp()
            SecureField("password",
                        text: $vm.loginData.password)
                .loginFieldSetUp()
        }
        .padding()
    }
    
    private func submitButton(title: String, action: @escaping () -> Void) -> some View {
        Button(action: action, label: {
            Text(title)
                .frame(width: 200, height: 50)
                .background(Color.accentBlue)
                .cornerRadius(8)
                .foregroundColor(.white)
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(LoginViewModel(.signIn, state: AppState()))
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
    }
}
