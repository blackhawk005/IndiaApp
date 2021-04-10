//
//  ContentView.swift
//  Africa
//
//  Created by Shinit Shetty on 08/04/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    // BASIC GRID LAYOUT
    // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    @State private var isShowingSettings: Bool = false
    
    // MARK: - FUNCTIONS
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid NUmber: \(gridColumn)")
        
        // TOOLBAR IMAGE
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals){ animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            }//: LINK
                        }//: LOOP
                        CopyrightView()
                            .modifier(CenterModifier())
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }//: LINK
                            }//: LOOP
                        }//: GRID
                        .padding(10)
                        .animation(.easeIn)
                    }//: SCROLL
                }//: CONDITION
            }//: GROUP
            .navigationBarTitle("India", displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        // LIST
                        Button(action:{
                            print("List view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }//: BUTTON
                        // Grid
                        Button(action:{
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }){
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }//: BUTTON
                        // Button(action: {
                        //     isShowingSettings = true
                        //     haptics.impactOccurred()
                        // }){
                        //     Image(systemName: "info.circle")
                        //         .font(.title2)
                        //         .foregroundColor(isShowingSettings ? .accentColor : .primary)
                        // }//: BUTTON
                        // .sheet(isPresented: $isShowingSettings){
                        //     SettingsView()
                        //     }
                    }//: HSTACK
                }//: BUTTONS
            }//: TOOLBAR
        }//: NAVIGATION
    }
}


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
