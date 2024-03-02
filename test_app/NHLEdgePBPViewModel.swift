//
//  NHLEdgePBPViewModel.swift
//  test_app
//
//  Created by Chris Gutwin on 2024-03-01.
//

import Foundation

class NHLEdgePBPFetch {
    func getPbp(completion:@escaping (NHLEdgePBPModel) -> ()) {
            guard let url = URL(string: "https://api-web.nhle.com/v1/gamecenter/2023020818/play-by-play") else { return }
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let pbp = try! JSONDecoder().decode(NHLEdgePBPModel.self, from: data!)
                print(pbp)
            }
            .resume()
        }
}
