//
//  ResourceType.swift
//  Giphy
//
//  Created by Joe Riess on 5/19/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation
import Argo
import Result

public protocol ResourceType: Decodable {
    static func decode(_ json: JSON) -> Decoded<Self>
}

internal func decode<T: Decodable>(_ object: Any) -> Result<T, DecodeError> where T == T.DecodedType {
    let decoded: Decoded<T> = decode(object)
    switch decoded {
    case let .success(object):
        return .success(object)
    case let .failure(error):
        return .failure(error)
    }
}
