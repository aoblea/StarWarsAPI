//
//  StarWarsAPIApp.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 8/25/21.
//

import SwiftUI

@main
struct StarWarsAPIApp: App {
    
    // MARK: - Init
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "Bright-Blue")!]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "Bright-Blue")!]
        UINavigationBar.appearance().backgroundColor = UIColor(named: "Dark")
        UINavigationBar.appearance().barTintColor = UIColor(named: "Dark")
        UINavigationBar.appearance().tintColor = UIColor(named: "Bright-Blue")
        
        UITableView.appearance().backgroundColor = UIColor(named: "Dark")
    }
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
