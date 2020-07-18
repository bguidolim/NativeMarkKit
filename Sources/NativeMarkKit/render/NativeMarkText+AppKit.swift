import Foundation
#if canImport(AppKit) && canImport(SwiftUI)
import AppKit
import SwiftUI

public struct NativeMarkText: NSViewRepresentable {
    public typealias NSViewType = NativeMarkLabel

    let nativeMark: String
    let onOpenLink: ((URL) -> Void)?
    let styleSheet: StyleSheet
    
    public init(_ nativeMark: String, styleSheet: StyleSheet = .default, onOpenLink: ((URL) -> Void)? = nil) {
        self.nativeMark = nativeMark
        self.onOpenLink = onOpenLink
        self.styleSheet = styleSheet
    }
    
    public func makeNSView(context: Context) -> NativeMarkLabel {
        let label = NativeMarkLabel(nativeMark: nativeMark, styleSheet: styleSheet)
        label.onOpenLink = onOpenLink
        return label
    }
    
    public func updateNSView(_ nsView: NativeMarkLabel, context: Context) {
        nsView.nativeMark = nativeMark
        nsView.onOpenLink = onOpenLink
    }
}

#endif
