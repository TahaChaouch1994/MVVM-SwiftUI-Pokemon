//
//  ContentView.swift
//  MVVMPokedex
//
//  Created by Federico on 30/03/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            TabView{
                ScrollView {
                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                        ForEach(vm.filteredPokemon) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)
                            ) {
                                PokemonView(pokemon: pokemon)
                            }
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                    .navigationTitle("Pokemon")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Catalog")
                }
                
                Text("Favourite")
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favourite")
                }
                Text("My Pokemon")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("My Pokemon")
                }
            }
        }
        .environmentObject(vm)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
