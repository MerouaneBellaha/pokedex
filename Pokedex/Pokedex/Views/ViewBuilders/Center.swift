//
//  Center.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 14/09/2021.
//

import SwiftUI

struct Center<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Spacer()
        content
        Spacer()
    }
}
