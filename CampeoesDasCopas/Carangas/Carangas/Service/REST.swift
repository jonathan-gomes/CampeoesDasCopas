//
//  Rest.swift
//  Carangas
//
//  Created by Jonathan Gomes on 12/03/2019.
//  Copyright © 2019 Eric Brito. All rights reserved.
//

import Foundation

enum RESTError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJson
}
enum RESTOperation {
    case save
    case update
    case delete
}
class REST {
    
    private static let basePath = "https://carangas.herokuapp.com/cars"
    private static let fipePath = "https://fipeapi.appspot.com/api/1/carros/marcas.json"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    private static let session = URLSession(configuration: configuration)
    
    class func loadCars(onComplete: @escaping ([Car]) -> Void, onError: @escaping (RESTError) -> Void) {
        load(basePath: self.basePath, onComplete: onComplete, onError: onError)
    }
    class func loadBrands(onComplete: @escaping ([Brand]?) -> Void, onError: @escaping (RESTError) -> Void) {
        load(basePath: self.fipePath, onComplete: onComplete, onError: onError)
    }
    
    class func save(car: Car, onComplete: @escaping (Bool) -> Void) {
        applyOperation(car: car, operation: .save, onComplete: onComplete)
    }
    class func update(car: Car, onComplete: @escaping (Bool) -> Void) {
       applyOperation(car: car, operation: .update, onComplete: onComplete)
    }
    class func delete(car: Car, onComplete: @escaping (Bool) -> Void) {
        applyOperation(car: car, operation: .delete, onComplete: onComplete)
    }
    
    private class func load<T:Decodable>(basePath: String, onComplete: @escaping ([T]) -> Void, onError: @escaping (RESTError) -> Void) {
        guard let url = URL(string: basePath) else {
            onError(.url)
            return
        }
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {return}
                    do{
                        let objects = try JSONDecoder().decode([T].self, from: data)
                        onComplete(objects)
                    }catch {
                        onError(.invalidJson)
                    }
                } else {
                    onError(.responseStatusCode(code: response.statusCode))
                }
                
            } else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
    private class func applyOperation(car: Car, operation:RESTOperation, onComplete: @escaping (Bool) -> Void) {
        let urlStr = "\(basePath)/\((car._id ?? ""))"
        
        guard let url = URL(string: urlStr) else {
            onComplete(false)
            return
        }
        
        var request = URLRequest(url: url)
        var httpMethod = ""
        switch operation {
            case .save:
                httpMethod = "POST"
            case .update:
                httpMethod = "PUT"
            case .delete:
                httpMethod = "DELETE"
        }
        request.httpMethod = httpMethod
        guard let json = try? JSONEncoder().encode(car) else {
            onComplete(false)
            return
        }
        request.httpBody = json
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200, let _ = data else {
                    onComplete(false)
                    return
                }
                onComplete(true)
            } else {
                onComplete(false)
            }
        }
        dataTask.resume()
    }
}
