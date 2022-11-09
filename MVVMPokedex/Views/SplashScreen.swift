//
//  SplashScreen.swift
//  MVVMPokedex
//
//  Created by Taha Chaouch on 9/11/2022.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        }
        else {
            VStack {
                Spacer()
                Spacer()
                GifImage("pokemon")
                    .frame(width: 200, height: 200)
                Spacer()
            }
            .background(.white)
            .frame(width: .infinity, height: .infinity, alignment: .topLeading)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
            .colorScheme(.light)
        }
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
