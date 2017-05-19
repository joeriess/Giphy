//
//  ResourceType.swift
//  Giphy
//
//  Created by Joe Riess on 5/19/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation
import Argo

public protocol ResourceType: Decodable {
    static func decode(_ json: JSON) -> Decoded<Self>
}
