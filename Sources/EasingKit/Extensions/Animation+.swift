//
//  Animation+.swift
//  EasingKit
//
//  Created by Nozhan A. on 5/23/25.
//

import SwiftUICore

public extension Animation {
    /// A `CustomAnimation` that uses an easing function to animate a `VectorArithmetic`.
    /// - Parameters:
    ///   - easing: The easing function used to transform the value.
    ///   - duration: The duration of the animation.
    /// - Returns: An `EasingAnimation` wrapped in an `Animation`.
    static func eased(_ easing: Easing, duration: TimeInterval = 1.2) -> Animation {
        .init(EasingAnimation(duration: duration, easing: easing))
    }
}
