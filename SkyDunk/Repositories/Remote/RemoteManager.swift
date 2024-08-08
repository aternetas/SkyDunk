//
//  RemoteManager.swift
//  SkyDunk
//
//  Created by aternetas on 22.07.2024.
//

import Foundation
import Alamofire
import OSLog

class RemoteManager {
    
    private static var fileName = #file.split(separator: "/").last as Any
    
    private let KEY: String
    init() {
        KEY = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
    }
    
    private let URL: String = Bundle.main.object(forInfoDictionaryKey: "URL") as! String
    
    func fetch<T>(type: T.Type, path: String, params: [String: Any]? = nil, completion: @escaping (Result<T, Error>) -> ()) where T: Codable {
        AF.request("\(URL)/\(path)", parameters: params, headers: getHeaders()).response { [weak self] response in
            if let error = response.error {
                self?.log(error.localizedDescription, funcName: #function)
                completion(.failure(Errors.AlamofireError.cantGetData(error.localizedDescription)))
            }
            guard let data = response.data else {
                self?.log("Empty data", funcName: #function)
                completion(.failure(Errors.AlamofireError.unknownData))
                return
            }
            
            do {
                try self?.decodeResponse(type, from: data) { data in
                    completion(.success(data))
                }
            } catch {
                self?.log(error.localizedDescription, funcName: #function)
                completion(.failure(Errors.AlamofireError.nonConvertableData))
            }
        }
    }

    private func getHeaders() -> HTTPHeaders {
        if KEY.isEmpty {
            Logger.createLog("api-key is missing", .fault, fileName: "\(RemoteManager.fileName)", funcName: #function)
            fatalError()
        }
        return ["Authorization": "\(KEY)"]
    }
    
    private func decodeResponse<T>(_ type: T.Type, from data: Foundation.Data, completion: @escaping (T) -> ()) throws where T: Codable {
        completion(try JSONDecoder().decode(type, from: data))
    }
}

extension RemoteManager: MyLogger {
    
    func log(_ message: String, _ logType: OSLogType = .error, funcName: String) {
        Logger.createLog(message, logType, fileName: "\(RemoteManager.fileName)", funcName: funcName)
    }
}
