//
//  ViewController.swift
//  MvC3
//
//  Created by mac on 06/06/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var array = [["name": "Shubhanshu", "address": "Indore"], ["name": "Yogendra", "address": "Indore"], ["name": "Sansa Stark", "address": "Bhind"]]
    var throughDataModels = [DataModels]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRetunKey()
        configureTapGesture()
        appendingToDataModel()
        tableView.delegate = self
    }
    
    func appendingToDataModel() {
        for i in 0...(array.count-1) {
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
        else if(((nameTextField.text?.isEmpty == true) && (cityTextField.text?.isEmpty == false))) {
            createAlert(title: "No Name Found", message: "Please Enter Name")
        }
        else if(((nameTextField.text?.isEmpty == false) && (cityTextField.text?.isEmpty == true))) {
            createAlert(title: "No City Found", message: "Please Enter City")
        }
        else {
            createAlert(title: "No Input", message: "Please Enter Both The Inputs")
        }
    }
    
    func createAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func createAlert2(title:String, message:String,indexPath: IndexPath) {
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style:UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)
            self.array.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style:UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
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
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        createAlert2(title: "delete", message: "delete it?????", indexPath: indexPath)
    //    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("=========")
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // Do here
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        cityTextField.resignFirstResponder()
        return true
    }
}

//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return throughDataModels.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
//        let model:DataModels = throughDataModels[indexPath.row]
//        cell.nameLabel.text = model.name
//        cell.cityLabel.text = model.City
//        return cell
//    }
//
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        createAlert2(title: "delete", message: "delete it?????", indexPath: indexPath)
////    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("=========")
//    }
//
//
//}











