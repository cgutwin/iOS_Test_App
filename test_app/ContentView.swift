//
//  ContentView.swift
//  test_app
//
//  Created by Chris Gutwin on 2024-02-11.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "press to fetch"
    @State private var gameid = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("NHL Edge API")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .clipped()
                        Text("Game ID: \(gameid)")
                    }
                    .padding(.leading)
                    Button("Fetch Data") {
                        fetchData()
                    }
                    .padding(.trailing)
                }
                Text(message)
                    .padding()
                
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .padding(.bottom, 150)
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://api-web.nhle.com/v1/gamecenter/2023020818/play-by-play") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(NHLEdgePBPDataResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.message = decodedResponse.venue.venue
                        self.gameid = String(decodedResponse.id)
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
