import Foundation

let usersURL = URL(string: "https://randomuser.me/api")!

struct User {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob: Dob
    let registered: Registered
    let phone: Int
    let cell: Int
    let id: ID
    let picture: Picture
    let nat: String
}

struct Info {
    let seed: String
    let result: Int
    let page: Int
    let version: Double
}

//  MARK: - FIRST NESTING (1)

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
}

struct Login: Codable {
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
}

struct Dob: Codable {
    let date: String
    let age: Int
}

struct Registered: Codable {
    let date: String
    let age: Int
}

struct ID: Codable {
    let name: String
    let value: Int
}

struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

//  MARK: - SECOND NESTING (2)

struct Street: Codable {
    let number: Int
    let name: String
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}

struct Timezone: Codable {
    let offset: String
    let description: String
}
