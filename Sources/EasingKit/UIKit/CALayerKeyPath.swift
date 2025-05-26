//
//  CALayerKeyPath.swift
//  EasingKit
//
//  Created by Nozhan A. on 5/26/25.
//

struct CALayerKeyPath {
    private init() {}
    static let `default` = CALayerKeyPath()
    
    struct Transform {
        struct Rotation {
            let x = "transform.rotation.x"
            let y = "transform.rotation.y"
            let z = "transform.rotation.z"
        }
        
        struct Scale {
            let x = "transform.scale.x"
            let y = "transform.scale.y"
            let z = "transform.scale.z"
        }
        
        struct Translation {
            let x = "transform.translation.x"
            let y = "transform.translation.y"
            let z = "transform.translation.z"
        }
        
        let rotation = Rotation()
        let _rotation = "transform.rotation"
        
        let scale = Scale()
        let _scale = "transform.scale"
        
        let translation = Translation()
        let _translation = "transform.translation"
        
    }
    
    struct Position {
        let x = "position.x"
        let y = "position.y"
    }
    
    let transform = Transform()
    let position = Position()
    let _position = "position"
    let opacity = "opacity"
    let hidden = "hidden"
}
