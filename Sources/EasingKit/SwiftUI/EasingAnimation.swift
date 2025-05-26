//
//  EasingAnimation.swift
//  EasingKit
//
//  Created by Nozhan A. on 5/26/25.
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
