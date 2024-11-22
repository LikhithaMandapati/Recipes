//
//  RecipeCellView.swift
//  Recipes
//
//  Created by Likhitha Mandapati on 11/22/24.
//

import SwiftUI

struct RecipeCellView: View {
    let recipe: Recipe

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: recipe.photoURLSmall ?? "")) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            if let youtubeUrl = recipe.youtubeURL, let url = URL(string: youtubeUrl) {
                Link(destination: url) {
                    Image(systemName: "play.circle")
                        .font(.title3)
                        .foregroundColor(.red)
                        .padding(.top, 1)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct RecipeCellView_Previews: PreviewProvider {
    static var previews: some View {
        let mockRecipe = Recipe(
            id: "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
            name: "Bakewell Tart",
            cuisine: "British",
            photoURLLarge: "https://some.url/large.jpg",
            photoURLSmall: "https://some.url/small.jpg",
            sourceURL: "https://some.url/index.html",
            youtubeURL: "https://www.youtube.com/watch?v=some.id"
        )
        RecipeCellView(recipe: mockRecipe)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
