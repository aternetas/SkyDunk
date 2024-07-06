//
//  LastGamesController.swift
//  SkyDunk
//
//  Created by aternetas on 10.05.2024.
//

import UIKit

class LastGamesController: BaseController<LastGamesViewModel> {
    
    private let rootView = LastGamesView()

    override init() {
        super.init()
        viewModel = LastGamesViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
}

extension LastGamesController: LastGamesModelDelegate {
    
}
