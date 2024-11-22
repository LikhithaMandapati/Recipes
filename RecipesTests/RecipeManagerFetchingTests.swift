//
//  RecipeManagerTests.swift
//  RecipesTests
//
//  Created by Likhitha Mandapati on 11/22/24.
//

import XCTest
@testable import Recipes

class RecipeManagerFetchingTests: XCTestCase {
    
    var recipeManager: RecipeManager!

    override func setUpWithError() throws {
        super.setUp()
                recipeManager = RecipeManager()
    }

    func testFetchValidRecipes() async throws {
            let validURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
            recipeManager.url = validURL
            let recipes = try await recipeManager.fetchRecipes()
            XCTAssertFalse(recipes.isEmpty, "Valid recipes should be fetched successfully.")
        }
    
    func testFetchEmptyRecipes() async {
        let emptyURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")!
        recipeManager.url = emptyURL
        
        do {
            _ = try await recipeManager.fetchRecipes()
            XCTFail("Fetching empty data should throw an error.")
        } catch RecipeError.emptyData {
            XCTAssertTrue(true, "Empty data error should be thrown.")
        } catch {
            XCTFail("Unexpected error thrown: \(error)")
        }
    }
    
    func testFetchMalformedRecipes() async {
            let malformedURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")!
            recipeManager.url = malformedURL
            do {
                _ = try await recipeManager.fetchRecipes()
                XCTFail("Fetching malformed data should throw an error.")
            } catch RecipeError.malformedData {
                XCTAssertTrue(true, "Malformed data error should be thrown.")
            } catch {
                XCTFail("Unexpected error thrown.")
            }
        }
}
