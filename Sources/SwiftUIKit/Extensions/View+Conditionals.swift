//
//  View+Conditionals.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-08-04.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /// Hide the view if the provided condition is `true`.
    @ViewBuilder
    func hidden(if condition: Bool) -> some View {
        if condition {
            self.hidden()
        } else {
            self
        }
    }
    
    /// Make the view searchable if the condition is `true`.
    @ViewBuilder
    func searchable(
        if condition: Bool,
        text: Binding<String>,
        placement: SearchFieldPlacement = .automatic,
        prompt: String
    ) -> some View {
        if condition {
            self.searchable(
                text: text,
                placement: placement,
                prompt: prompt)
        } else {
            self
        }
    }
    
    #if !os(watchOS) && !os(tvOS)
    /// Make the view searchable if the condition is `true`.
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
    @ViewBuilder
    func searchable(
        if condition: Bool,
        text: Binding<String>,
        isPresented: Binding<Bool>,
        placement: SearchFieldPlacement = .automatic,
        prompt: Text? = nil
    ) -> some View {
        if condition {
            self.searchable(
                text: text,
                isPresented: isPresented,
                placement: placement,
                prompt: prompt
            )
        } else {
            self
        }
    }
    #endif
    
    /// Show the view if the provided condition is `true`.
    func visible(if condition: Bool) -> some View {
        hidden(if: !condition)
    }
}
