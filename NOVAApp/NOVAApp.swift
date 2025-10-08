import SwiftUI

@main
struct NOVAApp: App {
    @AppStorage("hasSeenWelcome") var hasSeenWelcome: Bool = false

    var body: some Scene {
        WindowGroup {
            if hasSeenWelcome {
                MainWebView()
                    .edgesIgnoringSafeArea(.all)
            } else {
                WelcomeView()
            }
        }
    }
}
