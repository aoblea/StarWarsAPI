//
//  ContentView.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 8/25/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            content()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Content
extension ContentView {
    func content() -> some View {
        MenuView()
            .navigationTitle("Star Wars")
            .navigationBarTitleDisplayMode(.large)
            .background(Color("Dark").edgesIgnoringSafeArea(.top))
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
