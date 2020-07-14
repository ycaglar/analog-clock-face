//
//  Dial.swift
//  Clock
//
//  Created by Caglar on 7/13/20.
//  Copyright © 2020 Caglar. All rights reserved.
//

import SwiftUI

/// The Dial is a guide of minute and hour markers for telling the time.
struct Dial: View {
    var body: some View {
        ZStack {
            MarkerRing(unit: .minute)
            MarkerRing(unit: .hour)
        }
    }
}

struct Dial_Previews: PreviewProvider {
    static var previews: some View {
        Dial()
    }
}
