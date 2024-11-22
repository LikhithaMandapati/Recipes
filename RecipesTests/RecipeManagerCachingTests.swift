//
//  RecipeManagerDecodingTests.swift
//  RecipesTests
//
//  Created by Likhitha Mandapati on 11/22/24.
//

import XCTest
@testable import Recipes

class ImageCacheManagerTests: XCTestCase {
    
    var imageCacheManager: ImageCacheManager!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        imageCacheManager = ImageCacheManager.shared
        clearCacheDirectory() // Clear cache before each test
    }
    
    override func tearDownWithError() throws {
        // Clear cache after each test to maintain test isolation
        clearCacheDirectory()
        try super.tearDownWithError()
    }
    
    // Helper function to clear the cache directory
    private func clearCacheDirectory() {
        let fileManager = FileManager.default
        if let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first {
            let cacheFiles = try? fileManager.contentsOfDirectory(at: cacheDirectory, includingPropertiesForKeys: nil)
            cacheFiles?.forEach { file in
                try? fileManager.removeItem(at: file)
            }
        }
    }
    
    
    func testRetrieveNonExistentImageFromCache() {
        let nonexistentURL = "https://example.com/nonexistent.png"
        
        // Attempt to retrieve a nonexistent image from the cache
        let cachedImage = imageCacheManager.getCachedImage(for: nonexistentURL)
        
        // Ensure no image is found for the nonexistent URL
        XCTAssertNil(cachedImage, "No data should be cached for a nonexistent image URL.")
    }
    
    func testClearCache() {
        let imageURL = "https://example.com/image.png"
        let mockImage = UIImage(systemName: "photo")!
        
        // Cache the image
        imageCacheManager.cacheImage(mockImage, for: imageURL)
        
        // Ensure the image is cached
        var cachedImage = imageCacheManager.getCachedImage(for: imageURL)
        XCTAssertNotNil(cachedImage, "The image should be cached initially.")
        
        // Clear the cache by removing cached files
        clearCacheDirectory()
        
        // Ensure the image is no longer cached after clearing
        cachedImage = imageCacheManager.getCachedImage(for: imageURL)
        XCTAssertNil(cachedImage, "The cache should be empty after clearing.")
    }
}
