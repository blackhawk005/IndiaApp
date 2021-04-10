//
//  HeadingView.swift
//  Africa
//
//  Created by Shinit Shetty on 08/04/21.
//

import SwiftUI

struct HeadingView: View {
    // MARK: PROPERTIES
    
    var headingImage: String
    var headingText: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }//: HSTACK
        .padding(.vertical)
    }
}


// MARK: - PREVIEW
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Picture")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
