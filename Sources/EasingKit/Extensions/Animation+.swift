//
//  Animation+.swift
//  EasingKit
//
//  Created by Nozhan A. on 5/23/25.
//

import SwiftUICore

struct EasingAnimation: CustomAnimation {
    let duration: TimeInterval
    let easing: Easing
    
    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        if time > duration { return nil }
        let interpolation = time / duration
        let eased = value.scaled(by: interpolation.eased(with: easing))
        return eased
    }
}

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
