//
//  ViewController.swift
//  ThrownErrorExample
//
//  Created by Yasin Dalkılıç on 16.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel.fetchData()
    }
        
}

