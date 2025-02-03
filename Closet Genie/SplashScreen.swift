//
//  SplashScreen.swift
//  Closet Genie
//
//  Created by Howie Huang on 2/3/25.
//


import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            Home() // Main app screen
        } else {
            ZStack {
                Color.white.ignoresSafeArea() // Full black background
                
                Image(systemName: "globe") // Ensure it's in Assets.xcassets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2.5) // Exact center
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}


