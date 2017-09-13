//
//  UserRequest.swift
//  SwiftViperSample
//
//  Created by 最上 聖也 on 2017/09/06.
//  Copyright © 2017年 Seiya Mogami. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol GithubRequest: Request {
}

extension GithubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
}

extension GithubRequest where Response: Himotoki.Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Self.Response {
        return try decodeValue(object)
    }
}

struct UserRequest: GithubRequest {
    typealias Response = [ApiUser]

    let username: String

    init(name: String) {
        self.username = name
    }

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/search/users"
    }

    var queryParameters: [String : Any]? {
        return [
            "q": username
        ]
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let dict = object as? [String:Any], let array = dict["items"] else {
            return try decodeArray(object)
        }
        return try decodeArray(array)
    }
}
