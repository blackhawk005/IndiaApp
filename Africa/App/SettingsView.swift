//
//  SettingsView.swift
//  Fructus
//
//  Created by Shinit Shetty on 11/04/21.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
        
    // MARK: - BODY
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 20) {
                    // MARK: - SECTION 1
                    GroupBox(
                        label:
                        SettingsLabelView(labelText: "India", labelImage: "info.circle")
                    ){
                        Divider()
                            .padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("This is an app that has description of animals with link to wikipedia, videos, photos and location of some national park in India in the MapView")
                                .font(.footnote)
                        }
                    }//: GROUPBOX
                    
                    
                    // MARK: - SECTION 2
                    GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")){
                        SettingsRowView(name: "Developer", content: "Shinit Shetty")
                        SettingsRowView(name: "Designer", content: "Shinit Shetty")
                        SettingsRowView(name: "Compatibility", content: "iOS 14")
                        SettingsRowView(name: "Dev's LinkedIN", linkLabel: "Shinit Shetty", linkDestination: "www.linkedin.com/in/shinit-shetty/")
                        SettingsRowView(name: "Dev's Github", linkLabel: "@blackhawk_005", linkDestination: "github.com/blackhawk005")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    }//: GROUPBOX
                
                }//: VSTACK
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: {
                    print("x mark pressed")
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "xmark")
                }
                )
                .padding()
            }//: SCROLL
        }
    }//: NAVIGATION
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView()
        }
    }
}
