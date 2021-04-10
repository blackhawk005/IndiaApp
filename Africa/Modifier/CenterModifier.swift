//
//  CenterModifier.swift
//  Africa
//
//  Created by Shinit Shetty on 10/04/21.
//

import SwiftUI

struct CenterModifier: ViewModifier{
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
