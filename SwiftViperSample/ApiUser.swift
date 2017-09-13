//
//  ApiUser.swift
//  SwiftViperSample
//
//  Created by 最上 聖也 on 2017/09/06.
//  Copyright © 2017年 Seiya Mogami. All rights reserved.
//

import Foundation
import Himotoki

struct ApiUser: Himotoki.Decodable {
    let name: String

    static func decode(_ e: Extractor) throws -> ApiUser {
        return try ApiUser(name: e <| "login")
    }
}
