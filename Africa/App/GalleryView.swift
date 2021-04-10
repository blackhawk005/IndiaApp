//
//  GalleryView.swift
//  Africa
//
//  Created by Shinit Shetty on 08/04/21.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    @State private var selectedAnimal: String = "lion"
    
    // SIMPLE GRID DEFINITION
    // let gridLayout: [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]
    
    // EFFECIENT GRID DEFINITION
    
    // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    let hapticIMpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - FUNCTION
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - IMAGE
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // MARK: - SLIDER
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                        hapticIMpact.impactOccurred()
                    })
                    
                
                // MARK: - GRID
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(item.image == selectedAnimal ? Color.accentColor : Color.white, lineWidth: item.image == selectedAnimal ? 5 : 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                hapticIMpact.impactOccurred()
                            }
                    }//: LOOP
                }//: VSTACK
                .padding(.horizontal, 10)
                .padding(.vertical, 50)
            }//: GRID
            .animation(.easeIn)
            .onAppear(perform: {
                gridSwitch()
            })
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
