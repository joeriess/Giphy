//
//  Gif.swift
//  Giphy
//
//  Created by Joe Riess on 5/18/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

public struct Gif {
    
    /// Type of gif 
    public let type: Type
    
    /// Username of the submitter
    public let username: String?
    
    /// Rating (g, pg, pg-13, r)
    public let rating: Rating
    
    /// Giphy user who submitted that gif
    public let user: User?
    
    ///
    public let isIndexable: Bool
    
    /// `Date` the gif was submitted
    public let importedDate: Date
    
    /// `Date` the gif was trending
    public let trendingDate: Date
    
}
