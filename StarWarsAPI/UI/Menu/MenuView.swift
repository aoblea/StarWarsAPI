//
//  MenuView.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 8/31/21.
//

import SwiftUI

struct MenuView: View {
    
    // MARK: - State
    @State private var selectedRow: StarWarsEndpoint = .films
    @State private var selection: String? // Navigation
    
    // MARK: - Properties
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    private let endpoints: [StarWarsEndpoint] = [.films, .people, .planets, .species, .starships, .vehicles]

    // MARK: - Body
    var body: some View {
        content()
            .background(Color("Dark"))
    }
}

// MARK: - Content
extension MenuView {
    func content() -> some View {
        ScrollView {
            NavigationLink(
                destination: DetailView(viewModel: DetailViewModel(selectedRow: selectedRow)),
                tag: "SHOW DETAIL VIEW",
                selection: $selection,
                label: {EmptyView()})
            
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(endpoints) { endpoint in
                    
                    Divider()
                    
                    Button {
                        print("BUTTON TAPPED FOR: \(endpoint)")
                        selectedRow = endpoint
                        selection = "SHOW DETAIL VIEW"
                    } label: {
                        HStack {
                            Spacer()
                            
                            VStack(alignment: .center) {
                                
                                Image(endpoint.imageString)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                
                                Text(endpoint.localizedDescription)
                                    .font(.title)
                                    .foregroundColor(Color("Bright-Blue"))
                            }
                            
                            Spacer()
                        }
                        .frame(height: 200)
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
