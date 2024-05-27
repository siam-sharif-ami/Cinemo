import SwiftUI

struct ShimmerView: View {
    @State private var startPoint: CGFloat = -1.0
    @State private var endPoint: CGFloat = 1.0
    
    var body: some View {
        GeometryReader { geometry in 
            Rectangle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [.gray.opacity(0.3), .gray.opacity(0.1), .gray.opacity(0.3)]),
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .frame(height: 220)
                .cornerRadius(10)
                .onAppear {
                    withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                        startPoint = 1.0
                        endPoint = 2.0
                    }
                }
        }
    }
}

#Preview{
    ShimmerView()
}
