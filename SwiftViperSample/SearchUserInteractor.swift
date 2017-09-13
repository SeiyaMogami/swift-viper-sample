//
//  SearchUserInteractor.swift
//  SwiftViperSample
//
//  Created by 最上 聖也 on 2017/09/06.
//  Copyright © 2017年 Seiya Mogami. All rights reserved.
//

import Foundation

protocol SearchUserInteractorDelegate {
    weak var output: SearchUserInteractorOutputDelegate? { get set }
    var dataStore: SearchUserDataStoreDelegate? { get set }
    func retriveUsers(_ keyword: String)
}

class SearchUserInteractor: SearchUserInteractorDelegate {
    weak var output: SearchUserInteractorOutputDelegate?
    var dataStore: SearchUserDataStoreDelegate?

    func retriveUsers(_ keyword: String) {
        print(keyword)
        dataStore?.fetchUsers(keyword, completion: { [weak self] data in
            self?.output?.didRetriveUsers(data)
            }, error: { [weak self] err in
                self?.output?.didFailToRetriveUsers(err)
        })
    }
}
