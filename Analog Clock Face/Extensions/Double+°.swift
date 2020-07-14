//
//  Double+DegreesOperator.swift
//  Clock
//
//  Created by Caglar on 7/10/20.
//  Copyright © 2020 Caglar. All rights reserved.
//

import SwiftUI

postfix operator °

extension Double {
    /// An extension for making Double -> Angle conversion easier
    /// - Parameter left: is a Double value representing the angle
    /// - Returns: the Angle equivalent of left in degrees
    static postfix func ° (left: Double) -> Angle {
        return Angle(degrees: left)
    }
}
