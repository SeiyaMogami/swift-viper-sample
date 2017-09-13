//
//  SearchUserDataStore.swift
//  SwiftViperSample
//
//  Created by 最上 聖也 on 2017/09/13.
//  Copyright © 2017年 Seiya Mogami. All rights reserved.
//

import Foundation
import APIKit

protocol SearchUserDataStoreDelegate: class {
    func fetchUsers(_ keyword: String, completion: @escaping ([ApiUser]) -> Void, error: @escaping (Error) -> Void)
}

class SearchUserDataStore: SearchUserDataStoreDelegate {
    func fetchUsers(_ keyword: String, completion: @escaping ([ApiUser]) -> Void, error: @escaping (Error) -> Void) {
        let request = UserRequest(name: keyword)
        Session.send(request) { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let err):
                error(err)
            }
        }
    }
}
