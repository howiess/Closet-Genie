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
    let posts = Array(repeating: PostModel(username: "user A", date: "Jan 1, 2025"), count: 5) // 5 posts for scrolling

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) { // Space between posts
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
            // Heading with Grey Background
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
            .padding()
            .background(Color.gray.opacity(0.2)) // Light grey background
            .cornerRadius(5) // Slight rounded edges

            // Image Content (Full Width)
            Image(systemName: "globe") // Placeholder content image
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity) // Full width
                .frame(height: UIScreen.main.bounds.width) // Square aspect ratio
                .clipped()
        }
    }
}


#Preview {
    Home()
}



