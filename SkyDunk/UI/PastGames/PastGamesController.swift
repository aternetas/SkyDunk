//
//  LastGamesController.swift
//  SkyDunk
//
//  Created by aternetas on 10.05.2024.
//

import UIKit

class PastGamesController: BaseController<PastGamesViewModel> {
    
    private let rootView = PastGamesView()

    override init() {
        super.init()
        viewModel = PastGamesViewModel()
        
        rootView.pastGamesTableView.delegate = self
        rootView.pastGamesTableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.getPastGames()
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
}

extension PastGamesController: PastGamesModelDelegate {
    
    func updatePastGames() {
        rootView.pastGamesTableView.reloadData()
    }
}

extension PastGamesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.pastGamesVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PastGameCell.identifier, for: indexPath) as! PastGameCell
        cell.bind(vm: viewModel.pastGamesVM[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (tableView.cellForRow(at: indexPath) as? PastGameCell)?.onClick()
    }
}

extension PastGamesController: PastGameCellListenerProtocol {
    
    func selectGame(gameId: String) {
        viewModel.selectGame(gameId: gameId)
    }
}
