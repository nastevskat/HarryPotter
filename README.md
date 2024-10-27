Harry Potter Universe Explorer

This project is a simple iOS application called "Harry Potter Universe Explorer" that allows users to explore a collection of Harry Potter books and characters. The app is built using MVC architecture with a programmatic approach, utilizing UIKit to provide a user-friendly interface for exploring books and characters.

Features

Books List: Users can view a list of Harry Potter books and select a book to see its details.

Characters List: Users can view a list of Harry Potter characters and select a character to see their details.

Tab Bar Interface: The app uses a UITabBarController to switch between the Books and Characters sections.

Network Service: Data for books and characters is fetched from a remote API.

Design Decisions

The project is implemented using MVC architecture to simplify the structure and make the code easy to understand for beginners.

A programmatic approach was used for UI setup to keep the project compatible with Xcode 11.5, avoiding any dependency on storyboard.

Custom ************TabBarController: The app has a custom UITabBarController for easy navigation between the books and characters.

A UITableView is used to list both books and characters, and tapping on an item opens the detail screen with more information.

Network Requests: The data for books and characters is fetched using URLSession, and the responses are decoded using the Codable protocol.

Bonus Features

Dynamic Images: Images for books and characters are fetched from the remote API and displayed in detail views.

Search Feature: A search bar is added for both the books and characters list, allowing users to search by title or name.

Prerequisites

Xcode 11.5 or later.

iOS 13.0 or later as the deployment target.

API Endpoints

The project uses data fetched from the following API endpoints:

Books: https://potterapi-fedeperin.vercel.app/en/books

Characters: https://potterapi-fedeperin.vercel.app/en/characters

Architecture

The project uses the Model-View-Controller (MVC) architecture:

Model: Represents the data (e.g., Book and Character structs).

View: Contains all the UI components (implemented programmatically without using storyboard).

Controller: Manages the data flow between the view and the model (BooksListViewController, CharactersListViewController, BookDetailViewController, and CharacterDetailViewController).

Dependencies

None. This project is built using native iOS components and doesn't require any third-party dependencies.

Known Issues

Compatibility: The project is built specifically for Xcode 11.5 and may not take advantage of newer features in more recent Xcode versions.
