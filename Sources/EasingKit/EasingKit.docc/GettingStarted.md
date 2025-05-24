# Getting Started

@Metadata {
    @PageImage(purpose: "card", source: "gettingstarted-card", alt: "A wireframe technology image representing the EasingKit framework.")
}

Setup EasingKit in your project.

## Overview

`EasingKit` is a lightweight, pure-swift package that helps you apply [easing functions](https://easings.net) in your application with high performace and minimal effort.

## Setup EasingKit in your project

You'll learn how to setup and apply `EasingKit` for a simple use-case in the following steps.

### Create a new project

Press ⌘ + ⇧ + N to create a new project, or ⌘ + ⌃ + ⇧ + N to create a new package.

### Add EasingKit as a dependency

Add `EasingKit` as a dependency in your swift package by pasting the following line in your `.dependencies`:

```swift
dependencies: [
    .package(url: "https://github.com/apple/swift-docc-plugin", branch: "main"),
],
```

Or if adding the dependency to an app, right-click the name of the project and click **Add Package Dependencies...**. Then paste the repo URL in the search field.
```
https://github.com/nozhana/EasingKit
```

## Animate a movement

### Create AnimationTestView.swift

1. Create a new SwiftUI view called `AnimationTestView` (or whatever you like).
2. Import `EasingKit` at the top of the file.

```swift
import EasingKit
```

### Setup AnimationTestView

1. Create a circle.
2. Create a `CGFloat` state variable to hold the circle's x-axis offset, and initialize it to -200.0.
3. In the `.onAppear` modifier, animate the x-axis offset to 200.0 using a `.default` animation and have it loop back and forth using `repeatForever()`.

```swift
struct AnimationTestView: View {
    @State private var xOffset: CGFloat = -200.0
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .offset(x: xOffset)
            .onAppear {
                withAnimation(.default.repeatForever()) {
                    xOffset = 200.0
                }
            }
    }
}
```

### Change the animation

Change the default animation to an eased animation with an `easeOutBounce` function.

> Tip: Try changing the `duration` of the animation, or applying a `.delay` before the `repeatForever()` modifier!

```swift
struct AnimationTestView: View {
    @State private var xOffset: CGFloat = -200.0
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .offset(x: xOffset)
            .onAppear {
                withAnimation(.eased(.easeOutBounce, duration: 1.3).delay(0.2).repeatForever()) {
                    xOffset = 200.0
                }
            }
    }
}
```

## Animate a transition

### Create TransitionTestView.swift

1. Create a new SwiftUI view called `TransitionTestView.swift`.
2. Import `EasingKit`.

### Setup the view

1. Create a circle in the middle of the screen.
2. Create a boolean state variable to show and hide the circle.
3. Create a button that toggles the state variable.

```swift
struct TransitionTestView: View {
    @State private var showCircle = false
    
    var body: some View {
        VStack {
            if showCircle {
                Circle()
                    .frame(width: 100, height: 100)
                    .transition(.scale)
            }
            
            Button("Show/Hide circle") {
                withAnimation {
                    showCircle.toggle()
                }
            }
        }
    }
}
```

### Change the animation

Change the animation to an `easeInOutCubic` animation.

> Tip: `easeInOut` functions work wonders with scale transitions! Just like `easeOut` functions and move transitions.

```swift
struct TransitionTestView: View {
    @State private var showCircle = false
    
    var body: some View {
        VStack {
            if showCircle {
                Circle()
                    .frame(width: 100, height: 100)
                    .transition(.scale)
            }
            
            Button("Show/Hide circle") {
                withAnimation(.eased(.easeInOutCubic)) {
                    showCircle.toggle()
                }
            }
        }
    }
}
```
