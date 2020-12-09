import Foundation

struct MarvelResponse: Codable {
    let data: MarvelData
}

struct MarvelData: Codable {
    var results: [Characters]
}

struct Characters: Codable {
    var name: String
}
