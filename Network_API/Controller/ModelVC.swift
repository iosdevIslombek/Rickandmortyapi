//
//  ModelVC.swift
//  Network_API
//
//  Created by Islomjon on 16/07/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ModelVC: UIViewController {
    
    public var url:String!

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var speciesLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var createdLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request(url, method: .get).response { [self] response in
            if let data = response.data {
                let json = JSON(data)
                nameLbl.text = json.stringValue
                imgView.sd_setImage(with: URL(string: json["image"].stringValue))
                nameLbl.text = json["name"].stringValue
                statusLbl.text = json["status"].stringValue
                speciesLbl.text = json["species"].stringValue
                genderLbl.text = json["gender"].stringValue
                locationLbl.text = json["location"]["name"].stringValue
                createdLbl.text = json["created"].stringValue
            }
        }

    }
}
