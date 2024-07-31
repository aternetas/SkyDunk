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

    private let forSeasons = "seasons[]=2023&seasons[]=2024"
    
    func getByAF<T>(type: T.Type, completion: @escaping (T) -> ()) where T: Codable {
        AF.request("https://api.balldontlie.io/v1/games?\(forSeasons)&postseason=true", headers: HTTPHeaders(getHeaders())).response { [self] response in
            guard let data = response.data else {
                print("unknown data")
                return
            }
            
            decodeResponse(type, from: data) { data in
                completion(data)
            }
        }
    }

    private func getHeaders() -> [String: String] {
        if KEY.isEmpty {
            fatalError("api-key is missing")
        }
        return ["Authorization": "\(KEY)"]
    }
    
    private func decodeResponse<T>(_ type: T.Type, from data: Foundation.Data, completion: @escaping (T) -> ()) where T: Codable {
        do {
            completion(try JSONDecoder().decode(type, from: data))
        }
        catch {
            print("failed to convert json, error: \(error.localizedDescription)")
        }
    }
}
