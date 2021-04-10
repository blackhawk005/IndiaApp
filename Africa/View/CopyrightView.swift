//
//  CopyrightView.swift
//  Africa
//
//  Created by Shinit Shetty on 10/04/21.
//

import SwiftUI

struct CopyrightView: View {
    // MARK: - PROPERTIES
    
    
    
    // MARK: - BODY
    var body: some View {
        VStack {
            
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    Copyright © Shinit Shetty
    All rights reserved
    Better apps Less Code
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }//: VSTACK
        .padding()
        .opacity(0.4)
    }
}


// MARK: - STRUCT
struct CopyrightView_Previews: PreviewProvider {
    static var previews: some View {
        CopyrightView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
