# ``EasingKit``

A lightweight pure-swift helper for easing interpolations and animations.

@Metadata {
    @PageImage(
               purpose: icon,
               source: "EasingKit-icon-color",
               alt: "A technology icon representing the EasingKit framework.")
    @PageColor(purple)
}

## Overview

`EasingKit` is comprised of an ``Easing`` enum and two extensions at this moment.

#### Inspiration

`EasingKit` is highly inspired by [easings.net](https://easings.net).

### Featured

@Links(visualStyle: detailedGrid) {
    - <doc:GettingStarted>
    - <doc:Easing>
}

## Topics

### Model

- ``Easing``

### BinaryFloatingPoint Extensions

- ``Swift/BinaryFloatingPoint/eased(with:)``
- ``Swift/BinaryFloatingPoint/interpolated(towards:amount:using:)``
- ``Swift/BinaryFloatingPoint/interpolated(towards:actualValue:using:)``
- ``Swift/BinaryFloatingPoint/eased(within:with:interpolatedWithin:)``

### Animation Extension

- ``SwiftUICore/Animation/eased(_:duration:)``
