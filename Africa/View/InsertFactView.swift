//
//  InsertFactView.swift
//  Africa
//
//  Created by Shinit Shetty on 09/04/21.
//

import SwiftUI

struct InsertFactView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            TabView{
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//: TAB
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: Box
    }
}

// MARK: - PREVIEW
struct InsertFactView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsertFactView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
