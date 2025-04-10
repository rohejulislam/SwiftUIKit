//
//  Optional+IsSet.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Optional {
    
    /// Whether or not the value is `nil`.
    var isNil: Bool { self == nil }
    
    /// Whether or not the value is set and not `nil`.
    var isSet: Bool { !isNil }
}
