//
//  LocationDM.swift
//  Network_API
//
//  Created by Islomjon on 17/07/22.
//

import Foundation
import SwiftyJSON

struct LocationDM {
    
    var name:String
    var url:String
    
    init(jsonData: JSON) {
        self.name = jsonData["location"]["name"].stringValue
        self.url = jsonData["location"]["url"].stringValue
    }
    
}
