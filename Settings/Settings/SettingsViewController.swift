//
//  SettingsViewController.swift
//  Settings
//
//  Created by m.igonin on 25.02.2020.
//  Copyright © 2020 m.igonin. All rights reserved.
//

import UIKit
import Core

class SettingsViewController: UIViewController {

    var storage: IStorage!
    
    @IBOutlet weak var endpointTextField: UITextField!
    @IBOutlet weak var featureSwitch: UISwitch!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var activateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        endpointTextField.delegate = self
        valueTextField.delegate = self
        
        loadEnvironment()
        updateActionButton()
    }
    
    @IBAction func enpointTextFieldValueChanged(_ sender: Any) {
        saveEnvironment()
    }
    
    @IBAction func featureSwitchValueChanged(_ sender: Any) {
        saveEnvironment()
    }
    
    @IBAction func valueTextFieldValueChanged(_ sender: Any) {
        saveEnvironment()
    }
    
    @IBAction func activateButtonTapped(_ sender: Any) {
        storage.setUseSharedEnvironment(!storage.useSharedEnvironment)
        saveEnvironment()
        updateActionButton()
    }
    
    private func updateActionButton() {
        if storage.useSharedEnvironment {
            activateButton.setTitle("Disactivate", for: .normal)
            activateButton.backgroundColor = UIColor.systemGreen
        } else {
            activateButton.setTitle("Activate", for: .normal)
            activateButton.backgroundColor = UIColor.systemGray
        }
    }
    
    private func loadEnvironment() {
        if let environment = storage.sharedEnvironment {
            endpointTextField.text = EnvironmentVariable.xAPIEndpoint.valueFromEnvironmentOrDefault(environment)
            featureSwitch.isOn = Bool(EnvironmentVariable.xSomeFeature.valueFromEnvironmentOrDefault(environment)) ?? false
            valueTextField.text = EnvironmentVariable.xSomeValue.valueFromEnvironmentOrDefault(environment)
        }
    }
    
    private func saveEnvironment() {
        let environment: [String : String] = [
            EnvironmentVariable.xAPIEndpoint.rawValue: endpointTextField.text ?? "",
            EnvironmentVariable.xSomeFeature.rawValue: String(featureSwitch?.isOn ?? false),
            EnvironmentVariable.xSomeValue.rawValue: valueTextField.text ?? ""
        ]
        
        storage.setSharedEnvironment(environment)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
