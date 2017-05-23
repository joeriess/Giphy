//
//  Client.swift
//  Giphy
//
//  Created by Joe Riess on 5/19/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Argo
import Foundation
import ReactiveSwift
import Result

extension JSONSerialization {
    internal static func deserializeJSON(_ data: Data) -> Result<Any, AnyError> {
        return materialize(try JSONSerialization.jsonObject(with: data))
    }
}

public final class Client {
    
    // MARK: - Static properties
    
    static let publicAccessKey = "dc6zaTOxFJmzC"
    
    public static var userAgent: String?
    
    // MARK: - Public properties/types
    
    public enum Error: Swift.Error {
        
        /// An error occurred in a network operation.
        case networkError(Swift.Error)
        
        /// An error occurred while deserializing JSON.
        case jsonDeserializationError(Swift.Error)
        
        case jsonDecodingError
        
        case apiError(Int)
        
        case doesNotExist
    }
    
    /// The `URLSession` instance to use
    public let urlSession: URLSession
    
    // MARK: - Private properties
    
    /// API key to use for the connection to the API
    private let apiKey: String
    
    /// Construct a `Client` instance given an API key and a `URLSession` instance for making
    /// the requests
    public init(apiKey: String = Client.publicAccessKey,
                urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }
    
    public func random() -> SignalProducer<Gif, Error> {
        return fetch(URLRequest(url: URL(string: "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC")!))
    }
    
    private func fetch(_ urlRequest: URLRequest) -> SignalProducer<Gif, Error> {
        return urlSession
            .reactive
            .data(with: urlRequest)
            .mapError { Error.networkError($0.error) }
            .flatMap(.concat) { data, response -> SignalProducer<Gif, Error> in
                let response = response as! HTTPURLResponse
                return SignalProducer
                    .attempt {
                        return JSONSerialization.deserializeJSON(data).mapError { Error.networkError($0.error) }
                    }
                    .attemptMap { json in
                        print(json)
                        if response.statusCode == 404 {
                            return .failure(.doesNotExist)
                        }
                        if response.statusCode >= 400 && response.statusCode < 600 {
                            return .failure(.doesNotExist)
                        }
                        
                        if let gif: Gif = decode(json) {
                            return .success(gif)
                        } else {
                            return .failure(.jsonDecodingError)
                        }
                    }
        }
    }

}
