# MultimoneyCodeChallenge

This project utilizes a GraphQL API to fetch data from the Rick and Morty API. It implements features such as pagination and fetching character details.

## Technologies Used

- SwiftUI
- Apollo iOS (GraphQL client)
- MVVM (Model-View-ViewModel) architecture
- Dependency injection

## Features

- Fetching a list of characters from the GraphQL API
- Pagination support for loading more characters
- Displaying character details upon selection
- MVVM architecture for separation of concerns and maintainability
- Dependency injection for loose coupling and testability

## Installation

To run the project locally, follow these steps:

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the project on a simulator or device.

## Usage

- Launch the app to see a list of characters from the Rick and Morty API.
- Scroll through the list and tap on a character to view its details.
- Use the "Load More Data" button to fetch additional characters through pagination.
* Pagination is a demostration on how the project will add this feature.

## MVVM Architecture

We chose to implement the MVVM (Model-View-ViewModel) architecture in this project for the following reasons:

- **Separation of concerns**: MVVM allows clear separation between data (Model), UI (View), and logic (ViewModel). This separation improves code organization and maintainability.
- **Binding and Observability**: SwiftUI's data-binding and Combine framework integration make MVVM a natural fit. It simplifies UI updates when data changes and enables reactive programming patterns.

## Why Not VIPER and VIP Architectures?

Although VIPER and VIP (View-Interactor-Presenter) architectures are powerful and provide strong separation of concerns, we decided to go with MVVM due to the following reasons:

- **Simplicity**: MVVM has a simpler structure compared to VIPER and VIP, making it easier to grasp and maintain, especially for smaller projects.
- **SwiftUI Compatibility**: SwiftUI is a declarative UI framework, and MVVM aligns well with its data-driven approach. Integrating SwiftUI with VIPER or VIP architectures can be more complex.
- **Learning Curve**: MVVM has a relatively lower learning curve compared to VIPER and VIP. It allows for a smoother adoption, especially for developers new to architectural patterns.
