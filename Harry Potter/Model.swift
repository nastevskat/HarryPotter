import Foundation

struct Book: Codable {
    let number: Int
    let title: String
    let originalTitle: String
    let releaseDate: String
    let description: String
    let pages: Int
    let cover: String
}

struct Character: Codable {
    let fullName: String
    let nickname: String
    let hogwartsHouse: String
    let interpretedBy: String
    let children: [String]
    let image: String
    let birthdate: String
}
