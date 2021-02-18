//
//  MenuListText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

public struct MenuListText: View {
    
    public init(_ text: String) {
        self.text = text
    }
    
    private let text: String
    
    public var body: some View {
        Text(text)
            .lineSpacing(8)
            .padding(.vertical, 13)
    }
}

struct MenuListText_Previews: PreviewProvider {
    static var previews: some View {
        MenuListText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    }
}
