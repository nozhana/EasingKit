//
//  File.swift
//  EasingKit
//
//  Created by Nozhan A. on 5/26/25.
//

import QuartzCore

public extension CALayer {
    /// Animates a `CALayer` with a specified duration and easing, and other optional parameters.
    ///
    /// - Warning: `onEnded` runs **approximately** around the time the animation is logically complete.
    ///
    /// - Parameters:
    ///   - duration: The overall duration of the animation.
    ///   - easing: The easing used to interpolate through the animation.
    ///   - delay: The interval to postpone the beginning of the animation.
    ///   - repeatCount: The number of times the animation repeats before it completely stops. This property is ignored when zero. Defaults to zero.
    ///   - autoreverses: Whether the animation loops back and forth.
    ///   - additive: Whether the configuration applied in the `animations` block is additive, e.g. added to the current value, as opposed to absolute. True by default.
    ///   - animations: The block of animations to apply to the `CALayer` through a type-safe interface called the ``CALayerKeyframeConfigurator``.
    ///   - onEnded: The block of code to execute when the animation is logically complete.
    func animate(withDuration duration: TimeInterval, easing: Easing, delay: TimeInterval = .zero, repeatCount: Float = .zero, autoreverses: Bool = false, additive: Bool = true, animations: @escaping (_ configurator: CALayerKeyframeConfigurator) -> Void, onEnded: (@Sendable () -> Void)? = nil) {
        let configuration = CALayerKeyframeConfiguration(layer: self, easing: easing, duration: duration, delay: delay, repeatCount: repeatCount, autoreverses: autoreverses, additive: additive)
        let configurator = CALayerKeyframeConfigurator(configuration)
        animations(configurator)
        guard repeatCount < .infinity else { return }
        Timer.scheduledTimer(withTimeInterval: delay + duration * (autoreverses ? 2 : 1) * Double(repeatCount), repeats: false) { timer in
            onEnded?()
            timer.invalidate()
        }
    }
}
