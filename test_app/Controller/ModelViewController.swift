//
//  ModelViewController.swift
//  test_app
//
//  Created by Chris Gutwin on 2024-03-01.
//

import Foundation

class ModelViewController: UIViewController {
    var data: NHLEdgePBPData
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fetchData() {
        let urlString = "https://api-web.nhle.com/v1/gamecenter/2023020818/play-by-play"
        let networkManager = NetworkManager()
        networkManager.fetch(urlString: urlString) { [weak self] (result: Result<[Model], Error>) in
                
        }
    }
}
