import EasingKit
import SwiftUI

struct ContentView: View {
    @State private var showItems = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: .zero) {
                Color.clear.frame(maxWidth: .infinity, maxHeight: .zero)
                ForEach(0..<20) { index in
                    Group {
                        if showItems {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.purple)
                                .frame(height: 44)
                                .padding(.vertical, 4)
                                .transition(
                                    .move(edge: .trailing)
                                    .combined(with: .offset(x: 16))
                                )
                        }
                    }
                    .animation(.eased(.easeInOutBack).delay(.init(index)/15), value: showItems)
                }
            }
        }
        .safeAreaPadding(.horizontal, 16)
        .safeAreaInset(edge: .bottom) {
            Toggle("Show Items", isOn: $showItems)
                .font(.headline)
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .background(.bar)
        }
    }
}

#Preview {
    ContentView()
}
