//
//  LinkText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-07-31.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//
//  Original: https://stackoverflow.com/questions/73133551
//

import SwiftUI

/// This view can be used to render text with tappable links.
///
/// The view is initialized with ``Component`` items and can
/// mix texts and links in any way you like.
///
/// You can use standard `.font` and `.foregroundStyle` view
/// modifiers to style text and `.accentColor` to tint links.
/// You can also use a ``LinkText/Style`` to style the links
/// further, making them bold or italic.
public struct LinkText: View {

    /// Create a link text.
    ///
    /// - Parameters:
    ///   - components: The components to render.
    public init(_ components: [Component]) {
        self.components = components
    }

    private let components: [Component]
    
    @Environment(\.linkTextStyle)
    private var style
    
    public var body: some View {
        Text(markdownText)
    }
}

public extension LinkText {

    /// This enum defines available ``LinkText`` components.
    enum Component {

        /// Plain text.
        case text(String)

        /// A link with a text and a link.
        case link(String, URL?)
    }
}

private extension LinkText.Component {
    
    func markdown(
        _ style: LinkText.Style
    ) -> String {
        switch self {
        case .text(let text): text
        case .link(let text, let url): "[\(text)](\(url?.absoluteString ?? ""))"
                .markdownBold(if: style.bold)
                .markdownItalic(if: style.italic)
        }
    }
}

private extension String {
    
    func markdownBold(if condition: Bool) -> String {
        condition ? "**\(self)**" : self
    }
    
    func markdownItalic(if condition: Bool) -> String {
        condition ? "*\(self)*" : self
    }
}

private extension LinkText {
    
    var markdownText: LocalizedStringKey {
        .init(stringLiteral: components.map {
            $0.markdown(style)
        }.joined())
    }
}

#Preview {

    struct PreviewText: View {
        
        var body: some View {
            LinkText([
                .text("You must accept our "),
                .link("terms & conditions", .init(string: "https://danielsaidi.com")),
                .text(". Read more on our "),
                .link("website", .init(string: "https://danielsaidi.com")),
                .text(".")
            ])
        }
    }
    
    return List {
        PreviewText()
        
        PreviewText()
            .foregroundStyle(.red)
            .accentColor(.green)
        
        PreviewText()
            .font(.body.italic())
            .linkTextStyle(.bold)
        
        PreviewText()
            .font(.body)
            .linkTextStyle(.italic)
        
        PreviewText()
            .font(.body)
            .linkTextStyle(.boldItalic)
        
        PreviewText()
            .font(.headline.italic())
        
        PreviewText()
            .linkTextStyle(.italic)
        
        PreviewText()
            .accentColor(.orange)
            .lineSpacing(10)
    }
}
