//
//  ViewController.swift
//  App
//
//  Created by m.igonin on 25.02.2020.
//  Copyright © 2020 m.igonin. All rights reserved.
//

import UIKit
import Core

class ViewController: UIViewController {

    var environment: Environment!
    
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var endpointLabel: UILabel!
    @IBOutlet weak var featureLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateLabels()
    }

    private func updateLabels() {
        modeLabel.text = "Mode: \(environment.mode)"
        endpointLabel.text = "API endpoint: \(environment.apiEndpoint)"
        featureLabel.text = "Some feature toggle: \(environment.someFeature)"
        valueLabel.text = "Some value: \(environment.someValue)"
    }
}

