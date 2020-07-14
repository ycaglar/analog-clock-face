//
//  Movement.swift
//  Clock
//
//  Created by Caglar on 7/14/20.
//  Copyright © 2020 Caglar. All rights reserved.
//

import SwiftUI

/// Movement struct combines all moving hands in one view by stacking them in order.
struct Movement: View {
    var body: some View {
        ZStack {
            Hand(unit: .hour)
            Hand(unit: .minute)
            Hand(unit: .second)
        }
    }
}

struct Movement_Previews: PreviewProvider {
    static var previews: some View {
        Movement()
    }
}
