import SwiftUI

struct WelcomeView: View {
    @State private var scale: CGFloat = 0.6
    @State private var opacity: Double = 0.0
    @AppStorage("hasSeenWelcome") var hasSeenWelcome: Bool = false

    var body: some View {
        ZStack {
            Color(red: 14/255, green: 14/255, blue: 14/255).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                Spacer()
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 182/255, green: 87/255, blue: 1.0), Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 220, height: 220)
                        .scaleEffect(1.0 + 0.06 * sin(Double(Date().timeIntervalSinceReferenceDate)))
                        .blur(radius: 8)
                    Text("NOVA")
                        .font(.system(size: 56, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                        .scaleEffect(scale)
                        .opacity(opacity)
                }
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                        self.scale = 1.0
                        self.opacity = 1.0
                    }
                }

                Text("Добро пожаловать в NOVA — новая эра общения начинается здесь")
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .foregroundColor(Color(white: 0.86))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)

                Spacer()

                Button(action: {
                    // mark seen and proceed to web view
                    withAnimation {
                        self.hasSeenWelcome = true
                    }
                }) {
                    Text("Войти")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 182/255, green: 87/255, blue: 1.0), Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(14)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 40)
            }
        }
    }
}
