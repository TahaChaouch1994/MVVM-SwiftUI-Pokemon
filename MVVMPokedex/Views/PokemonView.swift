//
//  PokemonView.swift
//  MVVMPokedex
//
//  Created by Federico on 30/03/2022.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { image in
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                    Text("\(pokemon.name.capitalized)")
                        .font(.system(size: 16, weight: .regular, design: .monospaced))
                        .padding(.all, 20)
                        .frame(width: dimensions)
                }
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)

            }
            .background(.thinMaterial)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 3, x: 2, y: 2)


        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
