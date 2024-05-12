//
//  GameController.swift
//  SkyDunk
//
//  Created by f f on 12.05.2024.
//

import UIKit

class GameController: BaseController<GameViewModel> {

    override func viewDidLoad() {
        viewModel = GameViewModel()
        super.viewDidLoad()
    }
}
