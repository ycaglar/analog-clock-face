//
//  Part.swift
//  Clock
//
//  Created by Caglar on 7/10/20.
//  Copyright © 2020 Caglar. All rights reserved.
//

import SwiftUI

/// A model object representing parameters necessary to create clock parts
struct Part: Hashable, Codable, Identifiable {
    let id: Int
    let category: Category
    let name: Name
    fileprivate let shape_: Shapes
    var shape: Shape_ { Shape_(shape: shape_) }
    let dimensions: Dimensions
    fileprivate let color_: Colors
    var color: Color { Color(name: color_.rawValue) }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case timeMarkers = "Time Markers"
        case movingHands = "Moving Hands"
        case shaft = "Shaft"
    }
    
    enum Name: String, CaseIterable, Codable, Hashable {
        case minutes = "Minutes"
        case hours = "Hours"
        case secondsHand = "Seconds Hand"
        case secondsTip = "Seconds Tip"
        case thread = "Thread"
        case nut = "Nut"
    }
    
    enum Shapes: String, Codable, Hashable {
        case rectangle = "Rectangle"
        case circle = "Circle"
    }
    
    struct Shape_: View, Codable, Hashable {
        let shape: Shapes
        var body: some View {
            ZStack {
                Rectangle().opacity(shape == .rectangle ? 1 : 0)
                Circle().opacity(shape == .circle ? 1 : 0)
            }
        }
    }
    
    enum Colors: String, Codable, Hashable {
        case black = "Black"
        case red = "Red"
        case yellow = "Yellow"
    }
    
    struct Dimensions: Codable, Hashable {
        let width: CGFloat
        let length: CGFloat
        let offset: CGFloat
    }
}
