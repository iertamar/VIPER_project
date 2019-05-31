//
//  SelectedYearVC.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 08/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

class SelectYearVC: UIViewController{
    var tempArray: [PayLoadResponse.YearField] = []
    var curArr: [String] = []
    var selectedRow:Int = 0
    var selectedValueFromPicker: selectedCompletion?
    var presenter: PayLoadPresenter?
    
    let picker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .white
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let upperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(doneButtonPresed), for: .touchUpInside)
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonPresed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        picker.delegate = self
        picker.dataSource = self
    }
    
    func setUpView(){
        view.addSubview(containerView)
        containerView.addSubview(upperView)
        containerView.addSubview(picker)
        upperView.addSubview(doneButton)
        upperView.addSubview(cancelButton)
        
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        upperView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        upperView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        upperView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        upperView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        picker.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        picker.topAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        
        doneButton.trailingAnchor.constraint(equalTo: upperView.trailingAnchor).isActive = true
        doneButton.topAnchor.constraint(equalTo: upperView.topAnchor).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        cancelButton.leadingAnchor.constraint(equalTo: upperView.leadingAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: upperView.topAnchor).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    @objc func doneButtonPresed() {
        if curArr.count == 0 {
            dismiss(animated: true, completion: nil)
        }
        else {
            selectedValueFromPicker!(curArr[selectedRow])
            dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func cancelButtonPresed() {
        dismiss(animated: true, completion: nil)
    }
}
