//
//  Shaft.swift
//  Clock
//
//  Created by Caglar on 7/14/20.
//  Copyright © 2020 Caglar. All rights reserved.
//

import SwiftUI

/// In a physical clock, a shaft is the connection point of moving hands to the watch movement mechanism.
/// In Analog Clock Face, shaft works as a referrence point to the center of the clock face.
struct Shaft: View {
    private let shaftParams = shaft
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                self.body(in: min(proxy.size.width, proxy.size.height))
            }
        }
    }
    
    private func body(in size: CGFloat) -> some View {
        ForEach(shaftParams, id:\.self) { part in
            part.shape
                .frame(width: part.dimensions.width * size,
                       height: part.dimensions.length * size)
                .offset(y: part.dimensions.offset * size)
                .foregroundColor(part.color)
        }
    }
}

struct Shaft_Previews: PreviewProvider {
    static var previews: some View {
        Shaft()
    }
}
