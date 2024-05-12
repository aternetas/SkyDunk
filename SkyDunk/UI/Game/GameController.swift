//
//  GameController.swift
//  SkyDunk
//
//  Created by f f on 12.05.2024.
//

import UIKit

class GameController: BaseController<GameViewModel> {
    
    let rootView = GameView()
    
    override init() {
        super.init()
        viewModel = GameViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
        view.backgroundColor = .systemTeal
    }
}
