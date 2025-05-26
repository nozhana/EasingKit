//
//  CALayerKeyframeConfiguration.swift
//  EasingKit
//
//  Created by Nozhan A. on 5/26/25.
//

import QuartzCore

struct CALayerKeyframeConfiguration {
    var layer: CALayer
    var easing: Easing
    var duration: TimeInterval = 1.2
    var delay: TimeInterval = .zero
    var repeatCount: Float = .zero
    var autoreverses: Bool = false
    var additive: Bool = true
}
