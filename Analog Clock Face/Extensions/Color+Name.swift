//
//  Color+Name.swift
//  Clock
//
//  Created by Caglar on 7/13/20.
//  Copyright © 2020 Caglar. All rights reserved.
//

import SwiftUI

internal extension Color {
    /// Returns an actual color object for the specified color name.
    /// - Parameter name: is a string key for one of the three main colors of the user interface.
    init(name: String) {
        if(name == "Black") {
            self.init(UIColor.black)
        } else if(name == "Red") {
            self.init(UIColor.red)
        } else {
            self.init(UIColor.yellow)
        }
    }
}
