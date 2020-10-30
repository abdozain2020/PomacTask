//
//  AbstractViewModel.swift
//  Pomac Task
//
//  Created by Abdelrahman zain on 10/30/20.
//  Copyright © 2020 Abdelrahman zain. All rights reserved.
//

import Foundation

protocol ViewModelUIDelegate: class {
    func viewWillUpdate()
    func viewDidUpdate()
    func showErrorView(error: String)
}

class AbstractViewModel {
    weak var delegate: ViewModelUIDelegate?
}
