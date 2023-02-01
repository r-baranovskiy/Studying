import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let safeURLString = urlString else { return }
        guard let url = URL(string: safeURLString) else { return }
        
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
