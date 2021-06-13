//
//  PlacementSettings.swift
//  AR-App
//
//  Created by Mathan Jeya on 13/06/2021.
//

import SwiftUI
import ReplayKit
import Combine


class PlacementSettings: ObservableObject{
    //when the user selects a model in BrowseView, this property is set.
    @Published var selectedModel: Model? {
        willSet(newValue){
            print("setting selectedModel to \(String(describing : newValue?.name))")
        }
    }
    //when user taps confirm in placementView, the value of selectedModel is assigned to confirmedModel
    @Published var confirmedModel:Model?{
        willSet(newValue){
            guard let model = newValue else {
                print("Clearing confirmModel")
                return
            }
            print("Setting confirmedModel \(model.name)")
        }
    }
    //This property return the cancellable object for our SceneEvents.Update subscriber
    var sceneObserver:Cancellable?
}
