//
//  CharacterTVC.swift
//  Network_API
//
//  Created by Islomjon on 17/07/22.
//

import UIKit
import SDWebImage

class CharacterTVC: UITableViewCell {
    
    static func uinib()->UINib {
        return UINib(nibName: "CharacterTVC", bundle: nil)
    }
    static let identifier:String = "CharacterTVC"
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.masksToBounds = false
            containerView.layer.shadowColor = UIColor.darkGray.cgColor
            containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
            containerView.layer.shadowOpacity = 0.6
            containerView.layer.shadowRadius = 5
        }
    }
    @IBOutlet weak var cellView: UIView! {
        didSet {
            cellView.layer.masksToBounds = true
            cellView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var seenLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func updateCell(character:CharacterDM){
        imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imgView.sd_setImage(with: URL(string: character.image))
        nameLbl.text = character.name
        categoryLbl.text = character.category
        locationLbl.text = character.location.name
        seenLbl.text = "\(character._id)"
        if character.status == "Alive"{
            statusView.backgroundColor = .systemGreen
        }else if character.status == "Dead"{
            statusView.backgroundColor = .systemRed
        }else{
            statusView.backgroundColor = .lightGray
        }
    }
}
