import SwiftUI

struct ContentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(.red)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    ContentView()
}
