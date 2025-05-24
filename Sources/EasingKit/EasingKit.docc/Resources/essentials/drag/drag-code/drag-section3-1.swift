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
                        
                        width = min(max(width, -100), 100)
                        height = min(max(height, -100), 100)
                        
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
