//
//  SearchUserPresenter.swift
//  SwiftViperSample
//
//  Created by 最上 聖也 on 2017/09/13.
//  Copyright © 2017年 Seiya Mogami. All rights reserved.
//

import Foundation

protocol SearchUserPresenterDelegate: class {
    var view: SearchUserViewDelegate? { get set }
    var interactor: SearchUserInteractorDelegate? { get set }
    var wireframe: SearchUserWireframeDelegate? { get set }

    func retriveUsers(_ keyword: String)
    func userSelected(_ name: String)
}

class SearchUserPresenter: SearchUserPresenterDelegate {
    var view: SearchUserViewDelegate?
    var interactor: SearchUserInteractorDelegate?
    var wireframe: SearchUserWireframeDelegate?

    func retriveUsers(_ keyword: String) {
        print(keyword)
    }

    func userSelected(_ name: String) {

    }
}
