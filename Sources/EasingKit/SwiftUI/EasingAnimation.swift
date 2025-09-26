//
//  EasingAnimation.swift
//  EasingKit
//
//  Created by Nozhan A. on 5/26/25.
//

import SwiftUI

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

#Preview {
    @Previewable @State var scale: CGFloat = 1.0

    Circle()
        .fill(.blue)
        .frame(width: 100, height: 100)
        .scaleEffect(scale)
        .onTapGesture {
            withAnimation(.eased(.easeInBack, duration: 0.6)) {
                scale = scale == 1.0 ? 1.5 : 1.0
            }
        }
}
