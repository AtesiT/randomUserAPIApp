import Foundation

let usersURL = URL(string: "https://randomuser.me/api")!

//  MARK: - MAIN DATA

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
    
    init(userDetails: [String: Any]) {
        let gender = userDetails["gender"] as? String ?? ""
        
        let nameDetails = userDetails["name"] as? [String: String] ?? [:]
        name = Name(nameDetails: nameDetails)
        
        let locationDetails = userDetails["location"] as? [String: Any] ?? [:]
        location = Location(locationDetails: locationDetails)
        
        let loginDetails = userDetails["login"] as? [String: String] ?? [:]
        login = Login(loginDetails: loginDetails)
        
        let dobDetails = userDetails["dob"] as? [String: Any] ?? [:]
        dob = Dob(dobDetails: dobDetails)
        
        let registeredDetails = userDetails["registered"] as? [String: Any] ?? [:]
        registered = Registered(registeredDetails: registeredDetails)
        
        let phone = userDetails["phone"] as? Int ?? 0
        let cell = userDetails["cell"] as? Int ?? 0
        
        let idDetails = userDetails["id"] as? [String: Any] ?? [:]
        id = ID(idDetails: idDetails)
        
        let pictureDetails = userDetails["picture"] as? [String: String] ?? [:]
        picture = Picture(pictureDetails: pictureDetails)
        
        let nat = userDetails["nat"] as? String ?? ""
    }
    
    static func getRandomUsers(from value: Any) -> [User] {
        guard let value = value as? [String: Any] else {return []}
        guard let results = value["results"] as? [[String: Any]] else {return []}
        return results.map{ User(userDetails: $0) }
    }
}

struct Info {
    let seed: String
    let result: Int
    let page: Int
    let version: Double
    
    init(infoDetails: [String: Any]) {
        let seed = infoDetails["seed"] as? String ?? ""
        let result = infoDetails["results"] as? Int ?? 0
        let page = infoDetails["page"] as? Int ?? 0
        let version = infoDetails["version"] as? Double ?? 0.0
    }
}

//  MARK: - FIRST NESTING (1)

struct Name: Codable {
    let title: String
    let first: String
    let last: String
    
    init(nameDetails: [String: String]) {
        let title = nameDetails["title"] ?? ""
        let first = nameDetails["first"] ?? ""
        let last = nameDetails["last"] ?? ""
    }
}

struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
    
    init(locationDetails: [String: Any]) {
        let streetDetails = locationDetails["street"] as? [String: Any] ?? [:]
        street = Street(streetDetails: streetDetails)
        
        let city = locationDetails["city"] as? String ?? ""
        let state = locationDetails["state"] as? String ?? ""
        let country = locationDetails["country"] as? String ?? ""
        let postcode = locationDetails["postcode"] as? Int ?? 0
        
        let coordinatesDetails = locationDetails["coordinates"] as? [String: Double] ?? [:]
        coordinates = Coordinates(coordinatesDetails: coordinatesDetails)
        
        let timezoneDetails = locationDetails["timezone"] as? [String: String] ?? [:]
        timezone = Timezone(timezoneDetails: timezoneDetails)
    }
}

struct Login: Codable {
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
    
    
    init(loginDetails: [String: String]) {
        let uuid = loginDetails["uuid"] ?? ""
        let username = loginDetails["username"] ?? ""
        let password = loginDetails["password"] ?? ""
        let salt = loginDetails["salt"] ?? ""
        let md5 = loginDetails["md5"] ?? ""
        let sha1 = loginDetails["sha1"] ?? ""
        let sha256 = loginDetails["sha256"] ?? ""
    }
}

struct Dob: Codable {
    let date: String
    let age: Int
    
    init(dobDetails: [String: Any]) {
        let date = dobDetails["date"] as? String ?? ""
        let age = dobDetails["age"] as? Int ?? 0
    }
}

struct Registered: Codable {
    let date: String
    let age: Int
    
    init(registeredDetails: [String: Any]) {
        let date = registeredDetails["date"] as? String ?? ""
        let age = registeredDetails["age"] as? Int ?? 0
    }
}

struct ID: Codable {
    let name: String
    let value: Int
    
    init(idDetails: [String: Any]) {
        let name = idDetails["name"] as? String ?? ""
        let value = idDetails["value"] as? Int ?? 0
    }
}

struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
    
    init(pictureDetails: [String: String]) {
        let large = pictureDetails["large"] ?? ""
        let medium = pictureDetails["medium"] ?? ""
        let thumbnail = pictureDetails["thumbnail"] ?? ""
    }
}

//  MARK: - SECOND NESTING (2)

struct Street: Codable {
    let number: Int
    let name: String
    
    init(streetDetails: [String: Any]) {
        let number = streetDetails["number"] as? Int ?? 0
        let name = streetDetails["name"] as? String ?? ""
    }
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
    
    init(coordinatesDetails: [String: Double]) {
        let latitude = coordinatesDetails["latitude"] ?? 0.0
        let longitude = coordinatesDetails["longitude"] ?? 0.0
    }
}

struct Timezone: Codable {
    let offset: String
    let description: String
    
    init(timezoneDetails: [String: String]) {
        let offset = timezoneDetails["offset"] ?? ""
        let description = timezoneDetails["description"] ?? ""
    }
}
