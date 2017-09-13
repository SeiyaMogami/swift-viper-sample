//
//  SearchUserView.swift
//  SwiftViperSample
//
//  Created by 最上 聖也 on 2017/09/13.
//  Copyright © 2017年 Seiya Mogami. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol SearchUserViewDelegate: class {
    var presenter: SearchUserPresenterDelegate? { get set }
    func showUsers(_ users: [User])
    func showError(_ error: Error)
}


class SearchUserView: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var presenter: SearchUserPresenterDelegate?
    fileprivate var users: [User] = []
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()

        textField.rx.text.orEmpty
            .throttle(1, scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] text in
                self?.presenter?.retriveUsers(text)
            })
            .disposed(by: disposeBag)
    }
}

extension SearchUserView: SearchUserViewDelegate {
    func showUsers(_ users: [User]) {
        self.users = users
        tableView.reloadData()
    }

    func showError(_ error: Error) {
        print(error)
    }
}

extension SearchUserView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: present detail page
        print(users[indexPath.row])
    }
}
