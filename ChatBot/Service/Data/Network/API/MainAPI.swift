//
//  MainAPI.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import Foundation

typealias APIParameter = [String : Any]

public enum Method: String {
    case get
    case post
}

enum MainAPI {
    case fetchAPIKey(APIParameter)
}

public protocol APITargetType {
    
    var baseURL: URL { get }
    
    var path: String { get }
    
    var method: Method { get }
    
    var body: Data? { get }
    
    var headers: [String: String]? { get }
}

extension MainAPI: APITargetType {
    
    var baseURL: URL {
        switch self {
        case .fetchAPIKey:
            return URL(string: "")!
        }
    }
    
    var path: String {
        switch self {
        case .fetchAPIKey:
            return "/api/kappa"
        }
    }
    
    var method: Method {
        switch self {
        case .fetchAPIKey:
            return .post
            
        }
    }
    
    var body: Data? {
        switch self {
        case .fetchAPIKey(let param):
            return try? JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
}

extension APITargetType {
    
    func getURLRequest() -> URLRequest {
        
        var request = URLRequest(url: URL(target: self))
        
        request.httpBody = self.body
        request.httpMethod = self.method.rawValue
        request.allHTTPHeaderFields = self.headers
        
        log.i("urlRequest -> \(dump(request))")
        return request
    }
}

public extension URL {
    
    init<T: APITargetType>(target: T) {
        
        let targetPath = target.path
        
        if targetPath.isEmpty {
            self = target.baseURL
        } else {
            self = target.baseURL.appendingPathComponent(targetPath)
        }
    }
}
