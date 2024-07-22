//
//  RemoteServerManager.swift
//  SkyDunk
//
//  Created by aternetas on 22.07.2024.
//

import Foundation

class RemoteServerManager {
    
    private let KEY: String
    init() {
        KEY = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
    }

    private let forSeasons = "seasons[]=2023&seasons[]=2024"
    
    func getGames(completion: @escaping (Data) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.balldontlie.io/v1/games?\(forSeasons)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = createHeader()
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
            guard let data = data, error == nil else {
                print(error!.localizedDescription)
                return
            }
                
            do {
                let result = try JSONDecoder().decode(Data.self, from: data)
                completion(result)
            }
            catch {
                print("failed to convert json, error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    private func createHeader() -> [String: String] {
        if KEY.isEmpty {
            fatalError("api-key is missing")
        }
        return ["Authorization": "\(KEY)"]
    }
}
