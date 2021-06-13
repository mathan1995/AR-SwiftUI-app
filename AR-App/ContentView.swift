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
    @EnvironmentObject var placementSettings : PlacementSettings
    func makeUIView(context: Context) ->
        CustomARView {
            let arview = CustomARView (frame: .zero)
        
        //  Subscribe to SceneEvents.Update
        self.placementSettings.sceneObserver = arview.scene.subscribe(to: SceneEvents.Update.self, {(event) in
            
            self.updateScene(for: arview )
            
        })
            return arview
        }
    
    
    func updateUIView(_ uiView: CustomARView, context: Context) {}
    private func updateScene(for arView:CustomARView){
        //  Only display focusEntity when the user has selected a model fo placement
        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil
        
        // Add Model to scene if confirmed for placement
        if let confirmedModel = self.placementSettings.confirmedModel, let modelEntity = confirmedModel.modelEntity{
            
            self.place(modelEntity, in: arView)
            
            self.placementSettings.confirmedModel = nil
        }
    }
    
    private func place(_ modelEntity: ModelEntity, in arView:ARView){
        // 1.clone modelEntity. This creates an identical copy of modelEntity and references the same model. This also allow us to have multiple models of the same asset in our scene.
        let clonedEntity = modelEntity.clone(recursive: true)
        
        // 2.Enable transilation and rotation gestures
        clonedEntity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .rotation] , for: clonedEntity)
        
        // 3.Create an anchorEntity and add clonedEntity to the anchorEntity
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)
        
        // 4.Add the anchorEntity to the arView.scene
        arView.scene.addAnchor(anchorEntity)
        
        print("Added model entity to the scene.")
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PlacementSettings())
    }
}
