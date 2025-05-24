import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(.red)
            .frame(width: 100, height: 100)
            .offset(offset)
    }
}

#Preview {
    ContentView()
}
