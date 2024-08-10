//
//  RemoteManager.swift
//  SkyDunk
//
//  Created by aternetas on 22.07.2024.
//

import Foundation
import Alamofire

class RemoteManager {
    
    private let KEY: String
    init() {
        KEY = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
    }
    
    private let URL: String = Bundle.main.object(forInfoDictionaryKey: "URL") as! String
    
    func fetch<T>(type: T.Type, path: String, params: [String: Any]? = nil, completion: @escaping (Result<T, Error>) -> ()) where T: Codable {
        AF.request("\(URL)/\(path)", parameters: params, headers: getHeaders()).response { [weak self] response in
            if let error = response.error {
                completion(.failure(Errors.AlamofireError.cantGetData(error.localizedDescription)))
            }
            guard let data = response.data else {
                completion(.failure(Errors.AlamofireError.unknownData))
                return
            }

            do {
                try self?.decodeResponse(type, from: data) { data in
                    completion(.success(data))
                }
            } catch {
                completion(.failure(Errors.AlamofireError.nonConvertableData))
            }
        }
    }
    
    private func decodeResponse<T>(_ type: T.Type, from data: Data, completion: @escaping (T) -> ()) throws where T: Codable {
        completion(try JSONDecoder().decode(type, from: data))
    }

    private func getHeaders() -> HTTPHeaders {
        if KEY.isEmpty {
            fatalError("api-key is missing")
        }
        return ["Authorization": "\(KEY)"]
    }
}
