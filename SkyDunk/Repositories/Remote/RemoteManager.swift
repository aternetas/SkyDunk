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
    
    func fetch<T>(type: T.Type, path: String, params: [String: Any], completion: @escaping (Result<T, Error>) -> ()) where T: Codable {
        AF.request("\(URL)/\(path)", parameters: params, headers: getHeaders()).response { [weak self] response in
            switch response.result {
            case .success(let data):
                do {
                    try self?.decodeResponse(type, from: data ?? Data()) { data in
                        completion(.success(data))
                    }
                } catch {
                    completion(.failure(Errors.DecodeError.failedToConvertJSON(error.localizedDescription)))               }
            case .failure(let error):
                completion(.failure(Errors.AlamofireError.cantGetData(error.localizedDescription)))
            }
        }
    }
    
    private func getHeaders() -> HTTPHeaders {
        if KEY.isEmpty {
            fatalError("api-key is missing")
        }
        return ["Authorization": "\(KEY)"]
    }
    
    private func decodeResponse<T>(_ type: T.Type, from data: Foundation.Data, completion: @escaping (T) -> ()) throws where T: Codable {
        completion(try JSONDecoder().decode(type, from: data))
    }
}
