//
//  RemoteServerManager.swift
//  SkyDunk
//
//  Created by aternetas on 22.07.2024.
//

import Foundation
import Alamofire

class RemoteServerManager {
    
    private let KEY: String
    init() {
        KEY = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
    }

    private let forSeasons = "seasons[]=2023&seasons[]=2024"
    
    func getGamesByURLSession(completion: @escaping (Data) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.balldontlie.io/v1/games?\(forSeasons)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = getHeaders()
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print(error!.localizedDescription)
                return
            }
                
            self?.decodeResponse(data) { data in
                completion(data)
            }
        }
        task.resume()
    }
    
    func getGamesByAF(completion: @escaping (Data) -> ()) {
        AF.request("https://api.balldontlie.io/v1/games?\(forSeasons)&postseason=true", headers: HTTPHeaders(getHeaders())).response { [self] response in
            guard let data = response.data else {
                print("unknown data")
                return
            }
            
            decodeResponse(data) { data in
                completion(data)
            }
        }
    }
    
    private func getHeaders() -> [String : String] {
        if KEY.isEmpty {
            fatalError("api-key is missing")
        }
        return ["Authorization": "\(KEY)"]
    }
    
    private func decodeResponse(_ data: Foundation.Data, completion: @escaping (Data) -> ()) {
        do {
            completion(try JSONDecoder().decode(Data.self, from: data))
        }
        catch {
            print("failed to convert json, error: \(error.localizedDescription)")
        }
    }
}
