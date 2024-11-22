//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by Likhitha Mandapati on 11/22/24.
//

import Foundation

@MainActor
final class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var error: RecipeError?

    private let recipeManager = RecipeManager()

    func fetchData() {
        Task {
            do {
                let fetchedRecipes = try await recipeManager.fetchRecipes()
                guard !fetchedRecipes.isEmpty else {
                    throw RecipeError.emptyData
                }
                self.recipes = fetchedRecipes
            } catch let recipeError as RecipeError {
                self.error = recipeError
            } catch {
                self.error = .unknownError
            }
        }
    }
}
