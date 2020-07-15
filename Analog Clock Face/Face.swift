//
//  Face.swift
//  Clock
//
//  Created by Caglar on 7/14/20.
//  Copyright © 2020 Caglar. All rights reserved.
//

import SwiftUI

/// Main view for laying out necessary parts for building a clock
struct Face: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.vertical)
            Group {
                Circle()
                    .foregroundColor(Color.white)
                Dial()
                Movement()
                Shaft()
            }
            .padding()
        }
    }
}

struct Face_Previews: PreviewProvider {
    static var previews: some View {
        Face()
    }
}
