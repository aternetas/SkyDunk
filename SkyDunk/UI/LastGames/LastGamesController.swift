//
//  LastGamesController.swift
//  SkyDunk
//
//  Created by f f on 10.05.2024.
//

import UIKit

class LastGamesController: BaseController<LastGamesViewModel> {

    override init() {
        super.init()
        viewModel = LastGamesViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
}
