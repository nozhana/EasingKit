//
//  Comparable+.swift
//  EasingKit
//
//  Created by Nozhan A. on 5/23/25.
//

import Foundation

extension Comparable {
    func clamped(to range: ClosedRange<Self>) -> Self {
        min(max(self, range.lowerBound), range.upperBound)
    }
}
