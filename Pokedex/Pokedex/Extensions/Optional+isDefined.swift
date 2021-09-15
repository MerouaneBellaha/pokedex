//
//  Optional+isDefined.swift
//  Pokedex
//
//  Created by Merouane Bellaha on 15/09/2021.
//

import Foundation

extension Optional {
    var isDefined: Bool { self != nil }
    var isNotDefined: Bool { self == nil }
}
