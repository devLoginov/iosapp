import SwiftUI
import WebKit

struct MainWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKPreferences()
        prefs.javaScriptEnabled = true
        let config = WKWebViewConfiguration()
        config.preferences = prefs
        let webview = WKWebView(frame: .zero, configuration: config)
        webview.backgroundColor = UIColor(red: 14/255, green: 14/255, blue: 14/255, alpha: 1)
        webview.allowsBackForwardNavigationGestures = true

        if let indexURL = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "www") {
            webview.loadFileURL(indexURL, allowingReadAccessTo: indexURL.deletingLastPathComponent())
        } else if let url = URL(string: "about:blank") {
            webview.load(URLRequest(url: url))
        }
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
