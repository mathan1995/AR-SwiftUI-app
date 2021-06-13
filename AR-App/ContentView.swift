//
//  ContentView.swift
//  AR-App
//
//  Created by Mathan Jeya on 12/06/2021.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @State private var
        isControlsVisible: Bool = true
    @State private var showBrowse = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
           ARViewContainer()
            if self.placementSettings.selectedModel == nil {
                ControlView(isControlsVisible: $isControlsVisible,showBrowse: $showBrowse)
            }
            else{
                PlacementView()
            }
          
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ARViewContainer:
    UIViewRepresentable{
    func makeUIView(context: Context) ->
        ARView{
            let arview = ARView (frame: .zero)
            return arview
        }
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PlacementSettings())
    }
}
