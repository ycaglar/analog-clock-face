//
//  MarkerRing.swift
//  Clock
//
//  Created by Caglar on 7/13/20.
//  Copyright © 2020 Caglar. All rights reserved.
//

import SwiftUI

/// A set of time markers for slicing time into 12 or 60 equal sectors
struct MarkerRing: View {
    let π: Double = Double.pi
    let unit: MarkerUnit
    var marker: Part {
        timeMarkers.filter{$0.name.rawValue == unit.rawValue}[0]
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                self.body(in: min(proxy.size.width, proxy.size.height))
            }
        }
    }
    
    private func body(in size: CGFloat) -> some View {
        let sectorScalar: Double = 2.0 * π / Double(unit.frequency)
        return
            ZStack {
                ForEach(0..<unit.frequency) { degree in
                    self.marker.shape
                        .frame(width: self.marker.dimensions.width * size,
                               height: self.marker.dimensions.length * size)
                        .rotationEffect(Angle(radians: sectorScalar * Double(degree)))
                        .offset(
                            x: self.marker.dimensions.offset * size * CGFloat(sin(sectorScalar * Double(degree))),
                            y: -self.marker.dimensions.offset * size * CGFloat(cos(sectorScalar * Double(degree))))
                }
        }
    }
}

/// A limited set of time units. Constructor of MarkerRing struct is a MarkerUnit.
/// Time marker rings will be drawn on the screen depending on which MarkerUnit property was chosen.
enum MarkerUnit: String {
    case minute = "Minutes"
    case hour = "Hours"
    
    var frequency: Int {
        switch (self) {
        case .minute:
            return 60
        case .hour:
            return 12
        }
    }
}


struct MarkerRing_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MarkerRing(unit: .minute)
            MarkerRing(unit: .hour)
        }
    }
}
