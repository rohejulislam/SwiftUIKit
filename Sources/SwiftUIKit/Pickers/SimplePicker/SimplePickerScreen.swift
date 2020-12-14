//
//  SimplePickerScreen.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This screen can be used to easily show a picker with a main
 title view and an OK button that just dismisses the screen.
 
 This screen is mostly meant to be used on tvOS, but you can
 use it on any platform, although on iOS you should probably
 just wrap a picker in a native screen.
 */
public struct SimplePickerScreen<Picker: View, Title: View>: DismissableView {
    
    public init(
        title: Title,
        okButtonText: String = "OK",
        @ViewBuilder picker: @escaping PickerBuilder) {
        self.title = title
        self.okButtonText = okButtonText
        self.picker = picker()
    }
    
    private let title: Title
    private let okButtonText: String
    private let picker: Picker
    
    public typealias PickerBuilder = () -> Picker
    
    @Environment(\.presentationMode) public var presentationMode
    
    public var body: some View {
        VStack(spacing: 0) {
            title.padding()
            Divider()
            ScrollView { picker.padding() }
            Divider()
            Button(okButtonText, action: dismiss).padding()
        }
    }
}

struct SimplePickerScreen_Previews: PreviewProvider {
    
    enum Option: String, CaseIterable, SimplePickerValue {
        case one, two, three, four, five, six, seven, eight, nine, ten
        var id: String { rawValue }
        var displayName: String { rawValue }
    }
    
    class Context: ObservableObject {
        @Published var selection: Option = .one
    }
    
    @ObservedObject static var context = Context()
    
    static var previews: some View {
        SimplePickerScreen(
            title: Text("Välj grejer").font(.title),
            okButtonText: "Donediddely") {
            SimpleSinglePicker<Option>(
                selection: $context.selection,
                options: Option.allCases)
                .frame(width: 300)
        }
    }
}
