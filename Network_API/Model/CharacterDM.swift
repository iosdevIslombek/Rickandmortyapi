//
//  CharacterDM.swift
//  Network_API
//
//  Created by Islomjon on 17/07/22.
//

import Foundation
import SwiftyJSON

struct CharacterDM {
    
    var _id: Int
    var name: String
    var status: String
    var species:String
    var location: LocationDM
    var gender: String
    var image: String
    var episode:[String]
    var url:String
    
    var category: String {
        return status+" - "+species
    }
    
    init(jsonData:JSON) {
        self._id = jsonData["id"].intValue
        self.name = jsonData["name"].stringValue
        self.status = jsonData["status"].stringValue
        self.species = jsonData["species"].stringValue
        self.location = LocationDM(jsonData: jsonData)
        self.gender = jsonData["gender"].stringValue
        self.image = jsonData["image"].stringValue
        self.episode = jsonData["episode"].arrayValue.compactMap { $0.stringValue}
        self.url = jsonData["url"].stringValue
    }
    
}
