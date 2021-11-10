//
//  ListButtonItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view wraps the provided content in a ``ListItem`` that
 is wrapped in a `Button` that triggers the provided action.
 */
public struct ListButtonItem<Content: View>: View {
    
    public init(
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self.content = content
    }
    
    private let action: () -> Void
    @ViewBuilder private let content: () -> Content
    
    public var body: some View {
        Button(action: action) {
            ListItem(content: content)
        }.buttonStyle(.plain)
    }
}

struct ListButtonItem_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State var isToggled = false
        
        var body: some View {
            List {
                ListItem {
                    Text("Is toggled: \(isToggled ? 1 : 0)")
                }
                ListButtonItem(action: { isToggled.toggle() }, content: {
                    Text("Toggle")
                })
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
