import UIKit
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let urlParameters = [
        "results": "\(15)",
    ]
    
    private init() {}
    
    func fetchUsers(_ completion: @escaping (Result<[User],AFError>) -> Void) {
        AF.request(usersURL, parameters: urlParameters)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let users = User.getRandomUsers(from: value)
                    completion(.success(users))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchData(from url: String, _ completion: @escaping (Result<Data, AFError>) -> Void ) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

