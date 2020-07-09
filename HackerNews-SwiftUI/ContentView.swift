//
//  ContentView.swift
//  HackerNews-SwiftUI
//
//  Created by Atakan Çavuşlu on 9.07.2020.
//  Copyright © 2020 Atakan Çavuşlu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(posts) { post in
                Text(post.title)
            }
        .navigationBarTitle("Hacker News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Post: Identifiable {
    let id: String
    let title: String
}

let posts = [
    Post(id: "1", title: "Hello!"),
    Post(id: "2", title: "Bonjour!"),
    Post(id: "3", title: "Hola!")
]
