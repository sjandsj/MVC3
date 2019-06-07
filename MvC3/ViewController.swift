//
//  ViewController.swift
//  MvC3
//
//  Created by mac on 06/06/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var array = [["name": "Shubhanshu", "address": "Indore"], ["name": "Yogendra", "address": "Indore"], ["name": "Sansa Stark", "address": "Bhind"]]
    var throughDataModels = [DataModels]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRetunKey()
        configureTapGesture()
        appendindToDataModel()
    }
    
    func appendindToDataModel() {
        for i in 0...(array.count-1){
            let dict = array[i]
            self.throughDataModels.append(DataModels(goodName: dict["name"] ?? "", yourCity: dict["address"] ?? ""))
        }
        self.tableView.reloadData()
    }
    
    private func configureRetunKey() {
        nameTextField.delegate = self
        cityTextField.delegate = self
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }

    @IBAction func addButton(_ sender: Any) {
        handleTap()
        if (((nameTextField.text?.isEmpty == false) && (cityTextField.text?.isEmpty == false))) {
            let throughDataModel = DataModels(goodName: nameTextField.text!, yourCity: cityTextField.text!)
            throughDataModels.append(throughDataModel)
            tableView.reloadData()
            nameTextField.text=""
            cityTextField.text=""
        }
        else {
            return
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        cityTextField.resignFirstResponder()
        return true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return throughDataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let model:DataModels = throughDataModels[indexPath.row]
        cell.nameLabel.text = model.name
        cell.cityLabel.text = model.City
        return cell
    }
    
}











