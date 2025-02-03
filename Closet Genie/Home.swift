//
//  ContentView.swift
//  Closet Genie
//
//  Created by Howie Huang on 2/3/25.
//
import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            HomeFeed()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Home")
                }

            Discovery()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Discovery")
                }

            Post()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Post")
                }

            Outfits()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Outfits")
                }

            MyCloset()
                .tabItem {
                    Image(systemName: "globe")
                    Text("My Closet")
                }
        }
    }
}

// Home Feed View
struct HomeFeed: View {
    let posts = Array(repeating: PostModel(username: "username", date: "Jan 1, 2025"), count: 5) // Now 5 posts

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) { // Increased spacing for better scrolling
                    ForEach(posts.indices, id: \.self) { index in
                        PostView(post: posts[index])
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Home")
        }
    }
}

// Post Model
struct PostModel {
    let username: String
    let date: String
}

// Post View
struct PostView: View {
    let post: PostModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Heading
            HStack {
                Image(systemName: "globe") // Placeholder profile image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text(post.username)
                        .font(.headline)
                    Text(post.date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()
            }
            .padding(.horizontal)

            // Image Content
            Image(systemName: "globe") // Placeholder content image
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: UIScreen.main.bounds.width) // Square aspect ratio
                .clipped()
        }
    }
}

#Preview {
    Home()
}



