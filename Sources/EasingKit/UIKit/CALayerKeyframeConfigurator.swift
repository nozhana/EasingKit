//
//  CALayerKeyframeConfigurator.swift
//  EasingKit
//
//  Created by Nozhan A. on 5/26/25.
//

import UIKit
import SwiftUI

/// A type-safe interface for commonly used CALayer animatable keypaths.
///
/// - Note: You do not create this object directly. It is created for you when using ``UIKit/UIView/animate(withDuration:easing:delay:repeatCount:autoreverses:additive:animations:)``.
@dynamicMemberLookup
public struct CALayerKeyframeConfigurator {
    public struct Transform {
        public struct Rotation {
            fileprivate let configuration: CALayerKeyframeConfiguration
            
            public var x: Float {
                get { configuration.layer.transform.decomposed().rotation.x }
                nonmutating set { animateLayer(configuration: configuration, keyPath: \.transform.rotation.x, finalValue: newValue, startValue: x) }
            }
            
            public var y: Float {
                get { configuration.layer.transform.decomposed().rotation.y }
                nonmutating set { animateLayer(configuration: configuration, keyPath: \.transform.rotation.y, finalValue: newValue, startValue: y) }
            }
            
            public var z: Float {
                get { configuration.layer.transform.decomposed().rotation.z }
                nonmutating set { animateLayer(configuration: configuration, keyPath: \.transform.rotation.z, finalValue: newValue, startValue: z) }
            }
        }
        
        public struct Scale {
            fileprivate let configuration: CALayerKeyframeConfiguration
            
            public var x: Float {
                get { configuration.layer.transform.decomposed().scale.x }
                nonmutating set { animateLayer(configuration: configuration, keyPath: \.transform.scale.x, finalValue: newValue, startValue: x) }
            }
            
            public var y: Float {
                get { configuration.layer.transform.decomposed().scale.y }
                nonmutating set { animateLayer(configuration: configuration, keyPath: \.transform.scale.y, finalValue: newValue, startValue: y) }
            }
            
            public var z: Float {
                get { configuration.layer.transform.decomposed().scale.z }
                nonmutating set { animateLayer(configuration: configuration, keyPath: \.transform.scale.z, finalValue: newValue, startValue: z) }
            }
        }
        
        public struct Translation {
            fileprivate let configuration: CALayerKeyframeConfiguration
            
            public var x: Float {
                get { configuration.layer.transform.decomposed().translation.x }
                nonmutating set { animateLayer(configuration: configuration, keyPath: \.transform.translation.x, finalValue: newValue, startValue: x) }
            }
            
            public var y: Float {
                get { configuration.layer.transform.decomposed().translation.y }
                nonmutating set { animateLayer(configuration: configuration, keyPath: \.transform.translation.y, finalValue: newValue, startValue: y) }
            }
            
            public var z: Float {
                get { configuration.layer.transform.decomposed().translation.z }
                nonmutating set { animateLayer(configuration: configuration, keyPath: \.transform.translation.z, finalValue: newValue, startValue: z) }
            }
        }
        
        fileprivate let configuration: CALayerKeyframeConfiguration
        
        public var rotation: Rotation { .init(configuration: configuration) }
        
        public var scale: Scale { .init(configuration: configuration) }
        
        public var translation: Translation { .init(configuration: configuration) }
        
        @_documentation(visibility: public)
        public var _rotation: Float {
            get { configuration.layer.transform.decomposed().rotation.z }
            nonmutating set { animateLayer(configuration: configuration, keyPath: \.transform._rotation, finalValue: newValue, startValue: rotation) }
        }
        
        @_documentation(visibility: public)
        public var _scale: Float {
            get { configuration.layer.transform.decomposed().scale.max() }
            nonmutating set { animateLayer(configuration: configuration, keyPath: \.transform._scale, finalValue: newValue, startValue: scale) }
        }
        
        @_documentation(visibility: public)
        public var _translation: CGSize {
            get {
                let translation = configuration.layer.transform.decomposed().translation
                return CGSize(width: CGFloat(translation.x), height: CGFloat(translation.y))
            }
            nonmutating set { animateLayer(configuration: configuration, keyPath: \.transform._translation, finalValue: newValue, startValue: translation) }
        }
    }
    
    public struct Position {
        fileprivate let configuration: CALayerKeyframeConfiguration
        
        public var x: CGFloat {
            get { configuration.layer.position.x }
            nonmutating set { animateLayer(configuration: configuration, keyPath: \.position.x, finalValue: newValue, startValue: x) }
        }
        
        public var y: CGFloat {
            get { configuration.layer.position.y }
            nonmutating set { animateLayer(configuration: configuration, keyPath: \.position.y, finalValue: newValue, startValue: y) }
        }
    }
    
    init(_ configuration: CALayerKeyframeConfiguration) {
        self.configuration = configuration
    }
    
    public subscript(_ key: String) -> Any {
        get { self[dynamicMember: key] }
        nonmutating set { self[dynamicMember: key] = newValue }
    }
    
    public subscript(dynamicMember key: String) -> Any {
        get { Float.zero }
        nonmutating set { animateLayer(configuration: configuration, key: key, finalValue: newValue) }
    }
    
    private let configuration: CALayerKeyframeConfiguration
    
    public var transform: Transform { .init(configuration: configuration) }
    
    public var position: Position { .init(configuration: configuration) }
    
    public var opacity: Float {
        get { configuration.layer.opacity }
        nonmutating set { animateLayer(configuration: configuration, keyPath: \.opacity, finalValue: newValue, startValue: opacity) }
    }
    
    public var hidden: Bool {
        get { configuration.layer.isHidden }
        nonmutating set { animateLayer(configuration: configuration, keyPath: \.hidden, finalValue: newValue, startValue: hidden) }
    }
    
    @_documentation(visibility: public)
    public var _position: CGPoint {
        get { configuration.layer.position }
        nonmutating set { animateLayer(configuration: configuration, keyPath: \._position, finalValue: newValue, startValue: position) }
    }
}

private func animateLayer(configuration: CALayerKeyframeConfiguration, keyPath: KeyPath<CALayerKeyPath, String>, finalValue: Any, startValue: Any? = nil) {
    animateLayer(configuration: configuration, key: CALayerKeyPath.default[keyPath: keyPath], finalValue: finalValue, startValue: startValue)
}

private func animateLayer(configuration: CALayerKeyframeConfiguration, key: String, finalValue: Any, startValue: Any? = nil) {
    let animation = CAKeyframeAnimation(keyPath: key)
    
    animation.values = stride(from: 0.0, through: 1.0, by: 0.01).compactMap { interpolation in
        if let finalNumber = finalValue as? NSNumber {
            if !configuration.additive,
               let startNumber = startValue as? NSNumber {
                return startNumber.doubleValue.interpolated(towards: finalNumber.doubleValue, amount: interpolation, using: configuration.easing)
            } else {
                return finalNumber.doubleValue * interpolation.eased(with: configuration.easing)
            }
        } else if let floatingPoint = finalValue as? any BinaryFloatingPoint {
            if !configuration.additive,
               let startNumber = startValue as? any BinaryFloatingPoint {
                return CGFloat(startNumber).interpolated(towards: Double(floatingPoint), amount: interpolation, using: configuration.easing)
            } else {
                return CGFloat(floatingPoint) * interpolation.eased(with: configuration.easing)
            }
        } else if let size = finalValue as? CGSize {
            if !configuration.additive,
               let startSize = startValue as? CGSize {
                return CGSize(width: startSize.width.interpolated(towards: size.width, amount: interpolation, using: configuration.easing),
                              height: startSize.height.interpolated(towards: size.height, amount: interpolation, using: configuration.easing))
            } else {
                return CGSize(width: size.width * interpolation.eased(with: configuration.easing),
                              height: size.height * interpolation.eased(with: configuration.easing))
            }
        } else if let point = finalValue as? CGPoint {
            if !configuration.additive,
               let startPoint = startValue as? CGPoint {
                return CGPoint(x: startPoint.x.interpolated(towards: point.x, amount: interpolation, using: configuration.easing),
                               y: startPoint.y.interpolated(towards: point.y, amount: interpolation, using: configuration.easing))
            } else {
                return CGPoint(x: point.x * interpolation.eased(with: configuration.easing),
                               y: point.y * interpolation.eased(with: configuration.easing))
            }
        } else if let vector = finalValue as? any VectorArithmetic {
            return vector.scaled(by: interpolation.eased(with: configuration.easing))
        }
        return finalValue
    }
    
    animation.keyTimes = stride(from: 0.0, through: 1.0, by: 0.01).map(NSNumber.init)
    animation.duration = configuration.duration
    animation.beginTime = CACurrentMediaTime() + configuration.delay
    animation.repeatCount = configuration.repeatCount
    animation.autoreverses = configuration.autoreverses
    animation.isAdditive = configuration.additive
    
    configuration.layer.add(animation, forKey: UUID().uuidString)
}
