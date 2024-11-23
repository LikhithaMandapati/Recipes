# Recipes

- A simple iOS app that displays recipes fetched from a remote JSON source. It features recipe details, images, and YouTube links. Image caching is implemented for faster performance.

## 📋 Steps to Run the App

1. **Clone the Repository**  
   - Run the following command in your terminal:  
     ```bash
     git clone <https://github.com/LikhithaMandapati/Recipes.git>
     ```

2. **Open the Project**  
   - Open the Recipes.xcodeproj file in Xcode.

3. **Build and Run**  
   - Select the desired target:  **Simulator** or **Physical Device**  
   - Build and run the app.
   
4. **Permissions**
    - Ensure the app has internet access to fetch data.

5. **Explore the App**  
   - Browse recipes fetched from the external API.  
   - View images and links for each recipe.

---

## 📌 Focus Areas

- **API Integration**: Efficient data fetching from the external API.
- **User Interface**: Built with SwiftUI components like List, AsyncImage, and Link to display recipes and their details in an accessible and user-friendly format. 
- **Code Modularity**: Focused on modularizing the codebase for scalability and maintainability.
- **Networking and Asynchronous Data Fetching**: Used Swift’s async/await to fetch data seamlessly.
- **Image Caching**: Implemented an image caching mechanism to avoid re-downloading images every time they are needed. This improves performance, especially when dealing with large images.
- **Error Handling**: Prioritized robust error handling, including handling various errors like network issues and empty data, and providing user-friendly messages to inform the user about the problem.

---

## ⏱ Time Spent

- **Total Time**: Approximately 3 hours.  
- **Time Allocation**:  
  * Setup and Project Initialization: 20 min 
  * Networking Implementation: 1 hour
  * UI Design: 10 min
  * Image Caching Implementation: 30 min
  * Debugging and testing: 1 hour 

---

## ⚖️ Trade-offs and Decisions

- **Error Handling Simplicity**: Opted for a straightforward enum-based system for clarity.
- **Image Caching**: Chose a basic file-based approach instead of using a third-party library.
- **Minimal UI**: Focused on core functionality over advanced animations or visual effects.

---

## ❓ Weakest Part of the Project

- **Image caching implementation**: While functional, it lacks features like cache expiration and memory caching.

---

## 📦 External Code and Dependencies

- **Libraries Used**:  
  * None. All functionalities, including network requests and image loading, are implemented using Apple's native frameworks (URLSession, SwiftUI, etc.).

---

## 📝 Additional Information

- **Internet Connectivity**: The app requires an active connection to fetch recipes.
- **Asynchronous Operations**: Leveraged Swift’s async/await for asynchronous network requests, simplifying the process and improving readability of the code.
- **Error States**: Alerts notify users about issues like network errors or no data.
- **Caching**: Images are cached locally to avoid repeated downloads and improve performance.

---

Feel free to reach out if you have any questions or suggestions for improvement!  
