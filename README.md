# EasingKit

A pure **SwiftUI** implementation of all easing curves from [easings.net](https://easings.net), baked right into SwiftUI's `Animation` API and Core Animation.  
With EasingKit, you can bring natural, delightful, and expressive motion to your apps—no boilerplate, no guesswork.

---

## ✨ Features

- All easing curves from [easings.net](https://easings.net) reimplemented in **pure Swift**  
- Drop-in support for **SwiftUI Animations** (`withAnimation`, `.animation()`, etc.)  
- Compatible with **Core Animation** for UIKit/AppKit integrations  
- Lightweight, dependency-free, and easy to use  

---

## 📖 Documentation & Tutorials

- **Documentation:** [EasingKit Docs](https://nozhana.github.io/EasingKit/documentation/easingkit)
- **Tutorials:** [EasingKit Tutorials](https://nozhana.github.io/EasingKit/tutorials/easingkittutorials)  

---

## 🚀 Getting Started

### Installation

#### Swift Package Manager
Add EasingKit to your project by selecting  
**File > Add Packages…** in Xcode and entering:

```
https://github.com/nozhana/EasingKit
```

---

### Example Usage

```swift
import SwiftUI
import EasingKit

struct ContentView: View {
    @State private var scale: CGFloat = 1.0

    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .scaleEffect(scale)
            .onTapGesture {
                withAnimation(.eased(.easeInBack, duration: 0.6)) {
                    scale = scale == 1.0 ? 1.5 : 1.0
                }
            }
    }
}
```

## 💡 Inspiration

All easing functions are faithfully ported from the classic [easings.net](https://easings.net) library, giving you a complete set of motion tools for beautiful, expressive design.

---

## 📬 Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to open a PR or an issue in the [GitHub repo](https://github.com/nozhana/EasingKit).

---

## 📜 License

EasingKit is available under the MIT license.
