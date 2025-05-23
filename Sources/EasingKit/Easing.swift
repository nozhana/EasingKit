//
//  Easing.swift
//  EasingKit
//
//  Created by Nozhan A. on 5/22/25.
//

import Foundation

/// The definition of an easing function.
///
/// - Note: `allCases` refers to all easing functions. See ``Easing/easeIns``, ``easeOuts``, and ``easeInOuts`` as well.
public enum Easing: String, CaseIterable, Identifiable, Sendable {
    case easeInSine
    case easeInCubic
    case easeInQuint
    case easeInCirc
    case easeInElastic
    case easeInQuad
    case easeInQuart
    case easeInExpo
    case easeInBack
    case easeInBounce
    
    case easeOutSine
    case easeOutCubic
    case easeOutQuint
    case easeOutCirc
    case easeOutElastic
    case easeOutQuad
    case easeOutQuart
    case easeOutExpo
    case easeOutBack
    case easeOutBounce
    
    case easeInOutSine
    case easeInOutCubic
    case easeInOutQuint
    case easeInOutCirc
    case easeInOutElastic
    case easeInOutQuad
    case easeInOutQuart
    case easeInOutExpo
    case easeInOutBack
    case easeInOutBounce
    
    public var id: String { rawValue }
    
    /// Collection of all the available ease-ins.
    public static let easeIns = allCases.filter { $0.rawValue.hasPrefix("easeIn") && !$0.rawValue.hasPrefix("easeInOut") }
    /// Collection of all the available ease-outs.
    public static let easeOuts = allCases.filter { $0.rawValue.hasPrefix("easeOut") }
    /// Collection of all the available ease-in-outs.
    public static let easeInOuts = allCases.filter { $0.rawValue.hasPrefix("easeInOut") }
}

public extension Easing {
    /// Transforms an interpolation ranging from 0.0 to 1.0 using an easing function.
    /// - Parameter value: The interpolation amount to be eased, ranging from 0.0 to 1.0.
    /// - Returns: The eased interpolation amount, ranging from 0.0 to 1.0.
    func transform<T>(_ value: T) -> T where T: BinaryFloatingPoint {
        let value = value.clamped(to: 0.0...1.0)
        return switch self {
        case .easeInSine:
            value.easeInSine
        case .easeInCubic:
            value.easeInCubic
        case .easeInQuint:
            value.easeInQuint
        case .easeInCirc:
            value.easeInCirc
        case .easeInElastic:
            value.easeInElastic
        case .easeInQuad:
            value.easeInQuad
        case .easeInQuart:
            value.easeInQuart
        case .easeInExpo:
            value.easeInExpo
        case .easeInBack:
            value.easeInBack
        case .easeInBounce:
            value.easeInBounce
        case .easeOutSine:
            value.easeOutSine
        case .easeOutCubic:
            value.easeOutCubic
        case .easeOutQuint:
            value.easeOutQuint
        case .easeOutCirc:
            value.easeOutCirc
        case .easeOutElastic:
            value.easeOutElastic
        case .easeOutQuad:
            value.easeOutQuad
        case .easeOutQuart:
            value.easeOutQuart
        case .easeOutExpo:
            value.easeOutExpo
        case .easeOutBack:
            value.easeOutBack
        case .easeOutBounce:
            value.easeOutBounce
        case .easeInOutSine:
            value.easeInOutSine
        case .easeInOutCubic:
            value.easeInOutCubic
        case .easeInOutQuint:
            value.easeInOutQuint
        case .easeInOutCirc:
            value.easeInOutCirc
        case .easeInOutElastic:
            value.easeInOutElastic
        case .easeInOutQuad:
            value.easeInOutQuad
        case .easeInOutQuart:
            value.easeInOutQuart
        case .easeInOutExpo:
            value.easeInOutExpo
        case .easeInOutBack:
            value.easeInOutBack
        case .easeInOutBounce:
            value.easeInOutBounce
        }
    }
    
    /// The Y value for the lowest point of the easing function graph.
    ///
    /// - Note: This value usually equals `.zero` except when the function has backpull, e.g. ``easeInBack``, ``easeInElastic``.
    var minY: CGFloat {
        stride(from: 0, through: 1, by: 0.01).map(transform).min() ?? .zero
    }
    
    /// The Y value for the highest point of the easing function graph.
    var maxY: CGFloat {
        stride(from: 0, through: 1, by: 0.01).map(transform).max() ?? 1
    }
}

extension BinaryFloatingPoint {
    // MARK: - Ease-Ins
    var easeInSine: Self {
        Self(1 - cos(Double(self) * .pi / 2))
    }
    
    var easeInCubic: Self {
        Self(pow(Double(self), 3))
    }
    
    var easeInQuint: Self {
        Self(pow(Double(self), 5))
    }
    
    var easeInCirc: Self {
        Self(1 - sqrt(1 - pow(Double(self), 2)))
    }
    
    var easeInElastic: Self {
        let c4 = Double.pi * 2 / 3
        return switch self {
        case 0, 1: self
        default: Self(-pow(2.0, 10 * Double(self) - 10) * sin((Double(self) * 10 - 10.75) * c4))
        }
    }
    
    var easeInQuad: Self {
        self * self
    }
    
    var easeInQuart: Self {
        Self(pow(Double(self), 4))
    }
    
    var easeInExpo: Self {
        self == 0 ? 0 : Self(pow(2.0, 10 * Double(self) - 10))
    }
    
    var easeInBack: Self {
        let c1 = 1.70158
        let c3 = c1 + 1
        return Self(c3 * pow(Double(self), 3) - c1 * pow(Double(self), 2))
    }
    
    var easeInBounce: Self {
        1 - (1 - self).easeOutBounce
    }
    
    // MARK: - Ease-Outs
    
    var easeOutSine: Self {
        Self(sin(Double(self) * .pi / 2))
    }
    
    var easeOutCubic: Self {
        Self(1 - pow(1 - Double(self), 3))
    }
    
    var easeOutQuint: Self {
        Self(1 - pow(1 - Double(self), 5))
    }
    
    var easeOutCirc: Self {
        Self(sqrt(1 - pow(Double(self) - 1, 2)))
    }
    
    var easeOutElastic: Self {
        let c4: Double = 2 * .pi / 3
        return switch self {
        case 0, 1: self
        default: Self(pow(2, -10 * Double(self)) * sin((Double(self) * 10 - 0.75) * c4) + 1)
        }
    }
    
    var easeOutQuad: Self {
        1 - (1 - self) * (1 - self)
    }
    
    var easeOutQuart: Self{
        Self(1 - pow(1 - Double(self), 4))
    }
    
    var easeOutExpo: Self {
        self == 1 ? 1 : Self(1 - pow(2.0, -10 * Double(self)))
    }
    
    var easeOutBack: Self {
        let c1 = 1.70158
        let c3 = c1 + 1
        return Self(1 + c3 * pow(Double(self) - 1, 3) + c1 * pow(Double(self) - 1, 2))
    }
    
    var easeOutBounce: Self {
        let n1 = 7.5625
        let d1 = 2.75
        let x = Double(self)
        
        if x < 1 / d1 {
            return Self(n1 * x * x)
        } else if x < 2 / d1 {
            let x1 = x - 1.5 / d1
            return Self(n1 * x1 * x1 + 0.75)
        } else if x < 2.5 / d1 {
            let x1 = x - 2.25 / d1
            return Self(n1 * x1 * x1 + 0.9375)
        } else {
            let x1 = x - 2.625 / d1
            return Self(n1 * x1 * x1 + 0.984375)
        }
    }
    
    // MARK: - Ease-In-Outs
    
    var easeInOutSine: Self {
        Self(-(cos(.pi * Double(self)) - 1) / 2)
    }
    
    var easeInOutCubic: Self {
        Self(self < 0.5
             ? 4 * pow(Double(self), 3)
             : 1 - pow(-2 * Double(self) + 2, 3) / 2)
    }
    
    var easeInOutQuint: Self {
        Self(self < 0.5
             ? 16 * pow(Double(self), 5)
             : 1 - pow(-2 * Double(self) + 2, 5) / 2)
    }
    
    var easeInOutCirc: Self {
        Self(self < 0.5
             ? (1 - sqrt(1 - pow(2 * Double(self), 2))) / 2
             : (sqrt(1 - pow(-2 * Double(self) + 2, 2)) + 1) / 2)
    }
    
    var easeInOutElastic: Self {
        let c5 = Double.pi * 2 / 4.5
        return switch self {
        case 0, 1: self
        case ..<0.5: Self(-pow(2, 20 * Double(self) - 10) * sin((20 * Double(self) - 11.125) * c5)) / 2
        default: Self(pow(2, -20 * Double(self) + 10) * sin((20 * Double(self) - 11.125) * c5)) / 2 + 1
        }
    }
    
    var easeInOutQuad: Self {
        Self(self < 0.5
             ? 2 * pow(Double(self), 2)
             : 1 - pow(-2 * Double(self) + 2, 2) / 2)
    }
    
    var easeInOutQuart: Self {
        Self(self < 0.5
             ? 8 * pow(Double(self), 4)
             : 1 - pow(-2 * Double(self) + 2, 4) / 2)
    }
    
    var easeInOutExpo: Self {
        switch self {
        case 0,1: self
        case ..<0.5: Self(pow(2, 20 * Double(self) - 10) / 2)
        default: Self((2 - pow(2, -20 * Double(self) + 10)) / 2)
        }
    }
    
    var easeInOutBack: Self {
        let c1 = 1.70158
        let c2 = c1 * 1.525
        return self < 0.5
        ? Self(pow(2 * Double(self), 2) * ((c2 + 1) * 2 * Double(self) - c2)) / 2
        : Self(pow(2 * Double(self) - 2, 2) * ((c2 + 1) * (Double(self) * 2 - 2) + c2) + 2) / 2
    }
    
    var easeInOutBounce: Self {
        Self(self < 0.5
             ? (1 - (1 - 2 * Double(self)).easeOutBounce) / 2
             : (1 + (2 * Double(self) - 1).easeOutBounce) / 2)
    }
}
