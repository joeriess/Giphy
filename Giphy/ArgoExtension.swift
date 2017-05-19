//
//  ArgoExtension.swift
//  Giphy
//
//  Created by Joe Riess on 5/19/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation
import Argo

func toType(_ string: String) -> Decoded<Type> {
    return Decoded<Type>.fromOptional(Type(rawValue: string))
}

func toURL(_ string: String) -> Decoded<URL> {
    return Decoded<URL>.fromOptional(URL(string: string))
}
