//
//  RecipeManager.swift
//  Recipes
//
//  Created by Likhitha Mandapati on 11/22/24.
//

import Foundation
import UIKit

class RecipeManager {
    static let shared = RecipeManager()
    
    var url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
    
    // Fetch recipes from the server
    func fetchRecipes() async throws -> [Recipe] {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // Decode the response
            let recipeList = try JSONDecoder().decode(RecipeList.self, from: data)

            // Check if the recipes array is empty
            guard !recipeList.recipes.isEmpty else {
                throw RecipeError.emptyData
            }

            return recipeList.recipes
        } catch _ as DecodingError {
            throw RecipeError.malformedData
        } catch URLError.notConnectedToInternet {
            throw RecipeError.networkError
        } catch {
            throw error
        }
    }

    
    // Load image from cache or fetch it asynchronously
    func loadImage(from url: String) async -> UIImage? {
        // Check cache first
        if let cachedImage = ImageCacheManager.shared.getCachedImage(for: url) {
            return cachedImage
        }
        
        // If the image is not cached, download it asynchronously
        guard let imageUrl = URL(string: url) else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: imageUrl)
            guard let image = UIImage(data: data) else {
                return nil
            }
            
            // Cache the image for future use
            ImageCacheManager.shared.cacheImage(image, for: url)
            return image
        } catch {
            return nil
        }
    }
}
