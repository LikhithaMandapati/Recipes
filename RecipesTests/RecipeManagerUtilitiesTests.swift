//
//  RecipeManagerUtilitiesTests.swift
//  RecipesTests
//
//  Created by Likhitha Mandapati on 11/22/24.
//

import XCTest
@testable import Recipes

class RecipeManagerUtilitiesTests: XCTestCase {

    var recipeManager: RecipeManager!

    override func setUpWithError() throws {
        super.setUp()
        recipeManager = RecipeManager()
    }

    func testInvalidURL() async {
        let invalidURL = URL(string: "https://")! // Invalid URL
        recipeManager.url = invalidURL

        do {
            _ = try await recipeManager.fetchRecipes()
            XCTFail("Invalid URL should throw an error.")
        } catch {
            XCTAssertNotNil(error, "Error should not be nil for an invalid URL.")
        }
    }
}
