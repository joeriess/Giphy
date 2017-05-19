//
//  Gif.swift
//  Giphy
//
//  Created by Joe Riess on 5/18/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

public struct Gif: ResourceType {
    
    /// Type of gif 
    public let type: Type
    
    // Unique identifer
    public let id: String
    
    /// `URL` instance
    public let url: URL
    
    /// Username of the submitter
    public let username: String?
    
    /// Rating (g, pg, pg-13, r)
   /// public let rating: Rating
    
    /// Giphy user who submitted that gif
    ///public let user: User?
    
    ///
    ///public let isIndexable: Bool
    
    /// `Date` the gif was submitted
    ///public let importedDate: Date
    
    /// `Date` the gif was trending
    ///public let trendingDate: Date
    
}

// MARK: - Argo

extension Gif: Decodable {
    
    public static func decode(_ json: JSON) -> Decoded<Gif> {
        return curry(Gif.init)
            <^> (json <| "type" >>- toType)
            <*> json <| "id"
            <*> (json <| "url" >>- toURL)
            <*> json <|? "username"
    }
    
}
