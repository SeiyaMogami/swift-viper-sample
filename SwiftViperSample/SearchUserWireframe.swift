//
//  SearchUserWireframe.swift
//  SwiftViperSample
//
//  Created by 最上 聖也 on 2017/09/13.
//  Copyright © 2017年 Seiya Mogami. All rights reserved.
//

import UIKit

protocol SearchUserWireframeDelegate: class {
    static func createSearchUserView() -> UIViewController
}

class SearchUserWireframe: SearchUserWireframeDelegate {
    class func createSearchUserView() -> UIViewController {
        if let view = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? SearchUserView{
            let presenter = SearchUserPresenter()
            let interactor = SearchUserInteractor()
            let datastore = SearchUserDataStore()
            let wireframe = SearchUserWireframe()

            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireframe = wireframe
            interactor.dataStore = datastore
            interactor.output = presenter

            return view
        }
        return UIViewController()
    }
}
