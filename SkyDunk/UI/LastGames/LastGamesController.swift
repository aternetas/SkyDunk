//
//  LastGamesController.swift
//  SkyDunk
//
//  Created by f f on 10.05.2024.
//

import UIKit

class LastGamesController: BaseController<LastGamesViewModel> {

    override func viewDidLoad() {
        viewModel = LastGamesViewModel()
        super.viewDidLoad()
    
        view.backgroundColor = .brown
    }
}
