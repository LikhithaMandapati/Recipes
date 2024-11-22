//
//  ImageCacheManager.swift
//  Recipes
//
//  Created by Likhitha Mandapati on 11/22/24.
//

import Foundation
import UIKit
import CryptoKit

class ImageCacheManager {
    static let shared = ImageCacheManager()

    private init() {}

    // Returns the URL for caching an image based on the URL string
    private func cacheURL(for urlString: String) -> URL {
        let fileManager = FileManager.default
        let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
        return cacheDirectory.appendingPathComponent(urlString.sha256() + ".jpg") // Hashing the URL string to create a valid filename
    }

    // Check if the image is cached on disk
    func getCachedImage(for urlString: String) -> UIImage? {
        let cacheURL = cacheURL(for: urlString)
        if let imageData = try? Data(contentsOf: cacheURL), let image = UIImage(data: imageData) {
            return image
        }
        return nil
    }

    // Save the image to disk
    func cacheImage(_ image: UIImage, for urlString: String) {
        let cacheURL = cacheURL(for: urlString)
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            try? imageData.write(to: cacheURL)
        }
    }
}

private extension String {
    func sha256() -> String {
        let data = Data(self.utf8)
        let hash = data.withUnsafeBytes { return [UInt8](SHA256.hash(data: $0)) }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}
