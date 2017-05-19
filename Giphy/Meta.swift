//
//  Meta.swift
//  Giphy
//
//  Created by Joe Riess on 5/19/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

/// Metadata from a request
public struct Meta {
    
    /// Status code
    public let status: Int
    
    /// Message
    public let message: String
    
    /// The response identifer
    public let id: String
}

// MARK: - Equatable

extension Meta: Equatable {
    
    public static func ==(rhs: Meta, lhs: Meta) -> Bool {
        return rhs.id == lhs.id
    }
}
