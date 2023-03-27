//
//  SessionManager.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import Foundation

public protocol ResponseSerializerProtocol {
    associatedtype SerializedObject
    
    static func serialize(response: HTTPURLResponse?, data: Data?, error: Error?) throws -> SerializedObject
}

public final class SessionManager{
    
    class func response(request: URLRequest, completion: @escaping ((Result<Any, Error>) -> Void)) {
        
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: request) { (data, response, error) in
            
            do {
                
                let data = try SerializeManager.serialize(response: response as? HTTPURLResponse, data: data, error: error)
                
                completion(.success(data))
                
            } catch {
                log.i(error.localizedDescription)
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    class func responseDecodable<T: Decodable>(request: URLRequest, type: T.Type = T.self, completion: @escaping ((Result<T, Error>) -> Void)) {
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: request) { (data, response, error) in
            
            do {
                
                let data = try DecodableSerializeManager<T>.serialize(response: response as? HTTPURLResponse, data: data, error: error)
                
                completion(.success(data))
                
            } catch {
                log.i(error.localizedDescription)
                completion(.failure(error))
            }
            
        }.resume()
    }
    
}

public final class SerializeManager: ResponseSerializerProtocol {
    
    public static func serialize(response: HTTPURLResponse?, data: Data?, error: Error?) throws -> Any{
        
        guard error == nil else {
            throw error!
        }
        
        guard let data, !data.isEmpty else {
            throw Exception.GuardBinding.none
        }
        
        guard let response else {
            throw Exception.GuardBinding.none
        }
        
        guard 200...299 ~= response.statusCode else {
            throw Exception.NetWork.result(statusCode: response.statusCode.toString(), msg: "fail")
        }
        
        return try JSONSerialization.jsonObject(with: data)
        
    }
}

public final class DecodableSerializeManager<Base: Decodable>: ResponseSerializerProtocol {

    public static func serialize(response: HTTPURLResponse?, data: Data?, error: Error?) throws -> Base {
        guard error == nil else {
            throw error!
        }
        
        guard let data, !data.isEmpty else {
            throw Exception.GuardBinding.none
        }
        
        guard let response else {
            throw Exception.GuardBinding.none
        }
        
        guard 200...299 ~= response.statusCode else {
            throw Exception.NetWork.result(statusCode: response.statusCode.toString(), msg: "fail")
        }
        
        return try JSONDecoder().decode(Base.self, from: data)
    }
}

