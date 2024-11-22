//
//  RecipeError.swift
//  Recipes
//
//  Created by Likhitha Mandapati on 11/22/24.
//

import Foundation

enum RecipeError: Error, Identifiable {
    var id: String { localizedDescription }

    case networkError
    case dataCorruption
    case emptyData
    case malformedData
    case unknownError
    
    var localizedDescription: String {
        switch self {
        case .networkError:
            return "Failed to fetch recipes. Please check your internet connection and try again."
        case .dataCorruption:
            return "The data received was corrupted. Please try again later."
        case .emptyData:
            return "No recipes are currently available."
        case .malformedData:
            return "The recipe data format is incorrect. Please contact support or try again later."
        case .unknownError:
            return "An unknown error occurred. Please try again."
        }
    }
}
