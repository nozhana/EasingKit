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
                        offset = value.translation
                    }
                    .onEnded { _ in
                        withAnimation(.smooth) {
                            offset = .zero
                        }
                    }
            )
    }
}

#Preview {
    ContentView()
}
