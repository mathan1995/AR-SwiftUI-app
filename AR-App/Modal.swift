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
        
        init(name:String ,category:ModelCategory, scaleCompensation: Float = 1.0){
            self.name = name
            self.category = category
            self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
            self.scaleCompensation = scaleCompensation
            
            
        }
     //TODO create a method to async load modalEntity
}

struct Models {
    var all: [Model] = []
    
    init(){
        //Table
        let diningTable = Model(name: "obj_1", category: .table, scaleCompensation: 0.32/100)
        let familyTable = Model(name: "obj_2", category: .table, scaleCompensation: 0.32/100)
        
        self.all += [diningTable, familyTable]
        
        //Shoes
        let sneekerShoes = Model(name: "obj_3", category: .shoes, scaleCompensation: 0.32/100)
        let sportShoes = Model(name: "obj_4", category: .shoes, scaleCompensation: 0.32/100)
        
        self.all += [sneekerShoes, sportShoes]
        
       
        //Cups
        let cupNormal = Model(name: "obj_5", category: .cups, scaleCompensation: 0.32/100)
        let mugCup = Model(name: "obj_6", category: .cups, scaleCompensation: 0.32/100)
        
        self.all += [cupNormal, mugCup]
        
        //Others
        let guittar = Model(name: "obj_7", category: .others, scaleCompensation: 0.32/100)
        let flowerVas = Model(name: "obj_8", category: .others, scaleCompensation: 0.32/100)
        
        self.all += [guittar, flowerVas]
    }
    
    func get(category: ModelCategory) -> [Model] {
        return all.filter({$0.category == category})
    }
}

