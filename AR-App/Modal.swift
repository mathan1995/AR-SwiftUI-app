//
//  Modal.swift
//  AR-App
//
//  Created by Mathan Jeya on 13/06/2021.
//

import SwiftUI
import RealityKit
import Combine


enum ModelCategory: CaseIterable {
    case table
    case shoes
    case cups
    case others
    
    var label: String{
        get{
            switch self {
            case .table:
                return "Tables"
            case .shoes:
                return "Shoes"
            case .cups:
                return "Cups"
            case .others:
                return "Others"
           }
        }
    }
}



class Model {
        var name: String
        var category: ModelCategory
        var thumbnail: UIImage
        var modelEntity: ModelEntity?
        var scaleCompensation: Float
    
    private var cancellable : AnyCancellable?
        
        init(name:String ,category:ModelCategory, scaleCompensation: Float = 1.0){
            self.name = name
            self.category = category
            self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
            self.scaleCompensation = scaleCompensation
            
            
        }
    //Async Load mOdel Entity
    func asyncLoadModelEntity(){
        let filename = self.name + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: {loadCompletion in
                switch loadCompletion {
                case .failure(let error): print("Unable to load model entity for \(filename).Error: \(error.localizedDescription)")
                case.finished:
                break
                }
                
            },receiveValue: {modelEntity in
                
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scaleCompensation
                
                print("modelEntity for \(self.name) has been loaded.")
            })
        
        
    }
}

struct Models {
    var all: [Model] = []
    
    init(){
        //Table
        let diningTable = Model(name: "obj_1", category: .table, scaleCompensation: 0.5)
        let familyTable = Model(name: "obj_2", category: .table, scaleCompensation: 0.5)
        
        self.all += [diningTable, familyTable]
        
        //Shoes
        let sneekerShoes = Model(name: "obj_3", category: .shoes, scaleCompensation: 0.5)
        let sportShoes = Model(name: "obj_4", category: .shoes, scaleCompensation: 0.5)
        
        self.all += [sneekerShoes, sportShoes]
        
       
        //Cups
        let cupNormal = Model(name: "obj_5", category: .cups, scaleCompensation: 0.5)
        let mugCup = Model(name: "obj_6", category: .cups, scaleCompensation: 0.5)
        
        self.all += [cupNormal, mugCup]
        
        //Others
        let guittar = Model(name: "obj_7", category: .others, scaleCompensation: 0.5)
        let flowerVas = Model(name: "obj_8", category: .others, scaleCompensation: 0.5)
        
        self.all += [guittar, flowerVas]
    }
    
    func get(category: ModelCategory) -> [Model] {
        return all.filter({$0.category == category})
    }
}

