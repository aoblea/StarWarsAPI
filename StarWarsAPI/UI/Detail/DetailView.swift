//
//  DetailView.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 9/1/21.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - StateObject
    @StateObject var viewModel: DetailViewModel
    
    // MARK: - Body
    var body: some View {
        content()
            .onAppear {
                viewModel.getData()
            }
            .background(Color.white)
            .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Content
extension DetailView {
    func content() -> some View {
        // TODO: - Add conversion for height/weight | for galactic credits to usd
        VStack {
            
            if !viewModel.isUpdating {
                List {
                    ForEach(viewModel.model!.features) { feature in
                        HStack {
                            Text(feature.title)
                                .foregroundColor(Color("Bright-Blue"))
                            if viewModel.isFetching {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                            } else {
                                Text(feature.description)
                            }
                        }
                    }
                    .listRowBackground(Color("Dark"))
                }
            }
            
            Spacer()
            
            Picker(selection: $viewModel.pickerSelection,
                   label: Text("People")) {
                if viewModel.isFetching {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    PickerDataView()
                }
            }
            .colorMultiply(.black)
            .pickerStyle(WheelPickerStyle())
            .frame(height: 100)
            .clipped()

            Spacer()

            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(viewModel.topComparison.title)
                            .foregroundColor(Color("Bright-Blue"))
                        if viewModel.isFetching {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        } else {
                            Text(viewModel.topComparison.description)
                        }
                    }
                    HStack {
                        Text(viewModel.bottomComparison.title)
                            .foregroundColor(Color("Bright-Blue"))
                        if viewModel.isFetching {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        } else {
                            Text(viewModel.bottomComparison.description)
                        }
                    }
                }.padding(.leading, 20)
                Spacer()
            }
            .frame(height: 50)
            .background(Color("Dark"))
            
        }
    }
    
    func PickerDataView() -> AnyView {
        switch viewModel.selection {
        case .films:
            return AnyView(
                ForEach(viewModel.films) {
                        Text($0.title)
                    })
        case .people:
            return AnyView(
                ForEach(viewModel.people) {
                        Text($0.name)
                    })
        case .planets:
            return AnyView(
                ForEach(viewModel.planets) {
                        Text($0.name)
                    })
        case .species:
            return AnyView(
                ForEach(viewModel.species) {
                        Text($0.name)
                    })
        case .starships:
            return AnyView(
                ForEach(viewModel.starships) {
                        Text($0.name)
                    })
        case .vehicles:
            return AnyView(
                ForEach(viewModel.vehicles) {
                        Text($0.name)
                    })
        }
    }
}

// MARK: - Preview
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(selectedRow: .films))
    }
}
