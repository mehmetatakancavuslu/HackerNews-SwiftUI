//
//  NetworkManager.swift
//  HackerNews-SwiftUI
//
//  Created by Atakan Çavuşlu on 9.07.2020.
//  Copyright © 2020 Atakan Çavuşlu. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let e = error {
                print(e)
            } else {
                
                let decoder = JSONDecoder()
                guard let safeData = data else { return }
                
                do {
                    
                    let results = try decoder.decode(Results.self, from: safeData)
                    
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                    
                } catch {
                    print(error)
                }
                
            }
            
        }
        
        task.resume()
        
    }
    
}
