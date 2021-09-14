//
//  loginFieldStyle.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 14/09/2021.
//

import SwiftUI

struct Field: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.secondaryGreen)
            .cornerRadius(8)
            .foregroundColor(.black)
            .shadow(color: Color.darkGreen, radius: 8, x: 4.0, y: 5.0)
    }
}

extension View {
    func loginFieldStyle() -> some View {
        self.modifier(Field())
    }
}
