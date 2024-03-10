//
//  ViewController.swift
//  p6m3work1
//
//  Created by Олег Елисеев on 01.03.2024.
//

import UIKit

class ViewController: UIViewController {

    private let networkManager = NetworkManadger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.getNews(q: "game")
    }


}

