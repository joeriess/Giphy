//
//  User.swift
//  Giphy
//
//  Created by Joe Riess on 5/18/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

public struct User {
    
    /// Avatar image `URL`
    public let avatarURL: URL
    
    /// Banner image `URL`
    public let bannerURL: URL
    
    /// Profile `URL`
    public let profileURL: URL
    
    /// Their username
    public let username: String
    
    /// Actual name
    public let displayName: String
    
    /// Their twitter handle
    public let twitterHandle: String
    
}
