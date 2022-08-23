//
//  MainVC.swift
//  Network_API
//
//  Created by Islomjon on 16/07/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainVC: UIViewController {

    var characters:[CharacterDM] = []
    var lastData:[CharacterDM] = []
    var page: Int = 1
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
            tableView.register(CharacterTVC.uinib(), forCellReuseIdentifier: CharacterTVC.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Network API"
        getCharacters(page: page)
    }
    
    func getCharacters(page: Int) {
        AF.request("https://rickandmortyapi.com/api/character?page=\(page)", method: .get).response { response in
            if let data = response.data {
                let json = JSON(data)
                self.page += 1
                for i in json["results"].arrayValue {
                    self.characters.append(CharacterDM(jsonData: i))
                }
                self.lastData = json["results"].arrayValue.compactMap{ CharacterDM(jsonData: $0)}
                self.tableView.reloadData()
            }
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource -
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTVC.identifier, for: indexPath) as? CharacterTVC else {return UITableViewCell()}
        cell.updateCell(character: characters[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ModelVC(nibName: "ModelVC", bundle: nil)
        vc.url = characters[indexPath.row].url
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row % 20 == 16 && lastData.count == 20 && page == (indexPath.row/20) + 2 {
            getCharacters(page: self.page)
        }
    }
    
}
