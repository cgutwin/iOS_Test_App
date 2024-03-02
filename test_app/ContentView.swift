//
//  ContentView.swift
//  test_app
//
//  Created by Chris Gutwin on 2024-02-11.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "press to fetch"
    
    var body: some View {
        VStack {
            Text(message)
                .padding()
            Button("Fetch Data") {
                fetchData()
            }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://api-web.nhle.com/v1/gamecenter/2023020818/play-by-play") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(NHLEdgePBPDataResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.message = decodedResponse.venue.venue
                    }
                    return
                }
            }
        }.resume()
    }
 }

#Preview {
    ContentView()
}
