import Foundation

struct Character: Codable {
    var name: String
    var thumbnail: CharacterPhoto
}

struct CharacterPhoto: Codable {
    var path: String
    var `extension`: String
}
