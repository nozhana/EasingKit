//
//  BinaryFloatingPoint+.swift
//  EasingKit
//
//  Created by Nozhan A. on 5/23/25.
//

import Foundation

public extension BinaryFloatingPoint {
    /// Transforms an interpolation value ranging from 0.0 to 1.0 using an easing function.
    /// - Parameter easing: The easing function used to transform the interpolation value.
    /// - Returns: The transformed interpolation value.
    func eased(with easing: Easing) -> Self {
        easing.transform(clamped(to: 0.0...1.0))
    }
    
    /// Interpolates a value towards another value with an interpolation amount transformed using an easing function.
    /// - Parameters:
    ///   - other: The other value to interpolate towards.
    ///   - amount: The interpolation amount, ranging from 0.0 to 1.0.
    ///   - easing: The easing function used to transform the interpolation amount.
    /// - Returns: The final interpolated value.
    ///
    /// - Note: If you have access to the linearly interpolated value rather than the interpolation `amount`,
    /// use ``interpolated(towards:actualValue:using:)`` instead.
    func interpolated(towards other: Self, amount: Double, using easing: Easing) -> Self {
        self + (other - self) * Self(amount).eased(with: easing)
    }
    
    /// Interpolates a value towards another value using the actual linearly interpolated value transformed using an easing function.
    /// - Parameters:
    ///   - other: The other value to interpolate towards.
    ///   - actualValue: The linearly interpolated value, ranging from this value to `other`.
    ///   - easing: The easing function used to transform the linearly interpolated value.
    /// - Returns: The final interpolated value.
    ///
    /// - Note: If you have access to the original interpolation amount ranging from 0.0 to 1.0 rather than the `actualValue`,
    /// use ``interpolated(towards:amount:using:)`` instead.
    func interpolated(towards other: Self, actualValue: Self, using easing: Easing) -> Self {
        let interpolation = Double((actualValue - self) / (other - self)).clamped(to: 0.0...1.0)
        return interpolated(towards: other, amount: interpolation, using: easing)
    }
    
    /// Calculates the interpolation amount of this value ranging within the provided `ClosedRange`, transforms the amount using the easing function provided,
    /// and optionally maps the result to the provided output range.
    /// - Parameters:
    ///   - range: The range to calculate the interpolation amount for this value.
    ///   - easing: The easing function used to transform the interpolation amount.
    ///   - outputRange: The output range to map the eased interpolation amount to.
    /// - Returns: The eased interpolation amount, mapped to the output range.
    func eased(within range: ClosedRange<Self>, with easing: Easing, interpolatedWithin outputRange: ClosedRange<Self> = 0.0...1.0) -> Self {
        return outputRange.lowerBound.interpolated(towards: outputRange.upperBound, actualValue: self, using: easing)
    }
}
