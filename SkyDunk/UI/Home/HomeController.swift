//
//  HomeController.swift
//  SkyDunk
//
//  Created by f f on 10.05.2024.
//

import UIKit

class HomeController: UIViewController {
    
    private let viewModel = HomeViewModel() //just temporary 

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        
        view = HomeView()
    }
}
