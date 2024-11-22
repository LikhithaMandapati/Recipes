//
//  RecipeListView.swift
//  Recipes
//
//  Created by Likhitha Mandapati on 11/22/24.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject var viewModel = RecipeViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            // Title
            HStack {
                Text("Recipes")
                    .font(.custom("Georgia", size: 36))
                    .fontWeight(.bold)
                    .shadow(color: .gray.opacity(0.7), radius: 3, x: 5, y: 5)
                    .padding(.top, 20)
                
                Image(systemName: "fork.knife")
                    .font(.title)
                    .shadow(color: .gray.opacity(0.7), radius: 3, x: 5, y: 5)
                    .padding(.top, 20)
                
            }
            
            // List of recipes
            List {
                if viewModel.recipes.isEmpty {
                    Text("No recipes available.")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    ForEach(viewModel.recipes) { recipe in
                        RecipeCellView(recipe: recipe)
                    }
                }
            }
            .onAppear {
                viewModel.fetchData()  // Call the fetch function when the view appears
            }
            .refreshable {
                viewModel.fetchData()  // Refresh the data when the user pulls to refresh
            }
            .alert(item: $viewModel.error) { error in
                Alert(
                    title: Text("Error"),
                    message: Text(error.localizedDescription),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
