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
    func showDetail(_ user: User)
}

class SearchUserPresenter: SearchUserPresenterDelegate {
    var view: SearchUserViewDelegate?
    var interactor: SearchUserInteractorDelegate?
    var wireframe: SearchUserWireframeDelegate?

    func retriveUsers(_ keyword: String) {
        interactor?.retriveUsers(keyword)
    }

    func showDetail(_ user: User) {

    }
}

protocol SearchUserInteractorOutputDelegate: class {
    func didRetriveUsers(_ users: [ApiUser])
    func didFailToRetriveUsers(_ error: Error)
}

extension SearchUserPresenter: SearchUserInteractorOutputDelegate {
    func didRetriveUsers(_ users: [ApiUser]) {
        print(users)
        view?.showUsers(users.map{ User(name: $0.name) })
    }

    func didFailToRetriveUsers(_ error: Error) {
        view?.showError(error)
    }
}
