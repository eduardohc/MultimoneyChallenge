// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCharacterListQuery: GraphQLQuery {
  public static let operationName: String = "GetCharacterList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"""
      query GetCharacterList {
        characters {
          __typename
          results {
            __typename
            id
            name
            gender
            image
            species
            episode {
              __typename
              id
              name
            }
          }
        }
      }
      """#
    ))

  public init() {}

  public struct Data: MultimoneyAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MultimoneyAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("characters", Characters?.self),
    ] }

    /// Get the list of all characters
    public var characters: Characters? { __data["characters"] }

    /// Characters
    ///
    /// Parent Type: `Characters`
    public struct Characters: MultimoneyAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MultimoneyAPI.Objects.Characters }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
      ] }

      public var results: [Result?]? { __data["results"] }

      /// Characters.Result
      ///
      /// Parent Type: `Character`
      public struct Result: MultimoneyAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { MultimoneyAPI.Objects.Character }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", MultimoneyAPI.ID?.self),
          .field("name", String?.self),
          .field("gender", String?.self),
          .field("image", String?.self),
          .field("species", String?.self),
          .field("episode", [Episode?].self),
        ] }

        /// The id of the character.
        public var id: MultimoneyAPI.ID? { __data["id"] }
        /// The name of the character.
        public var name: String? { __data["name"] }
        /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
        public var gender: String? { __data["gender"] }
        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? { __data["image"] }
        /// The species of the character.
        public var species: String? { __data["species"] }
        /// Episodes in which this character appeared.
        public var episode: [Episode?] { __data["episode"] }

        /// Characters.Result.Episode
        ///
        /// Parent Type: `Episode`
        public struct Episode: MultimoneyAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { MultimoneyAPI.Objects.Episode }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", MultimoneyAPI.ID?.self),
            .field("name", String?.self),
          ] }

          /// The id of the episode.
          public var id: MultimoneyAPI.ID? { __data["id"] }
          /// The name of the episode.
          public var name: String? { __data["name"] }
        }
      }
    }
  }
}
