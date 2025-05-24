import EasingKit
import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(.red)
            .frame(width: 100, height: 100)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        var width = value.translation.width
                        var height = value.translation.height
                        
                        let topPull = height.eased(within: -300...(-100), with: .easeInSine, interpolatedWithin: -50...0)
                        let bottomPull = height.eased(within: 100...300, with: .easeOutSine, interpolatedWithin: 0...50)
                        let leadingPull = width.eased(within: -200...(-100), with: .easeInSine, interpolatedWithin: -35...0)
                        let trailingPull = width.eased(within: 100...200, with: .easeOutSine, interpolatedWithin: 0...35)
                        
                        width = min(max(width, -100), 100)
                        height = min(max(height, -100), 100)
                        
                        width = leadingPull + width + trailingPull
                        height = topPull + height + bottomPull
                        
                        let clampedOffset = CGSize(width: width, height: height)
                        
                        offset = clampedOffset
                    }
                    .onEnded { _ in
                        withAnimation(.eased(.easeOutElastic)) {
                            offset = .zero
                        }
                    }
            )
    }
}

#Preview {
    ContentView()
}
