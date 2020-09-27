//
//  Hand.swift
//  Clock
//
//  Created by Caglar on 7/14/20.
//  Copyright © 2020 Caglar. All rights reserved.
//

import SwiftUI

/// Hands are moving parts of the clock. Rotating at different speeds.
struct Hand: View {
    @State private var angle: Angle = 0°
    let unit: HandUnit
    private var hand: Array<Part> {
        movingHands.filter{$0.name.rawValue.hasPrefix(unit.rawValue)}
    }
    var body: some View {
        GeometryReader { proxy in
            GeometryReader { geo in
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        ZStack {
                            self.body(in: min(proxy.size.width, proxy.size.height))
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
            
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.angle += self.unit.speed
            }
        }
    }
    
    private func body(in size: CGFloat) -> some View {
        ZStack {
            ForEach(hand, id: \.self) { hand in
                hand.shape
                    .frame(width: hand.dimensions.width * size,
                           height: hand.dimensions.length * size)
                    .offset(y: hand.dimensions.offset * size)
                    .foregroundColor(hand.color)
            }
        }
        .rotationEffect(angle)
    }
}

struct Hand_Previews: PreviewProvider {
    static var previews: some View {
        Hand(unit: .second)
    }
}

enum HandUnit: String {
    case second = "Seconds"
    case minute = "Minutes"
    case hour = "Hours"
    
    var speed: Angle {
        switch (self) {
        case .second:
            return (6.0/1.0)°;
        case .minute:
            return (6.0/60.0)°
        case .hour:
            return (6.0/3600.0)°;
        }
    }
}
