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
    case chair
    case decor
    case light
    
    var label: String{
        get{
            switch self {
            case .table:
                return "Tables"
            case .chair:
                return "Chairs"
            case .decor:
                return "Decor"
            case .light:
                return "Lights"
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
        
        //Chairs
        let diningChair = Model(name: "obj_1", category: .chair, scaleCompensation: 0.32/100)
        let familyChair = Model(name: "obj_2", category: .chair, scaleCompensation: 0.32/100)
        
        self.all += [diningChair, familyChair]
        
       
        //Decors..
        //Lights..
    }
    
    func get(category: ModelCategory) -> [Model] {
        return all.filter({$0.category == category})
    }
}
