//
//  Header.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 09/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit
protocol StartDelegate {
    func startOverPressed()
    func reloadTableViewData()
}
class Header: UITableViewHeaderFooterView {
    var delegate: StartDelegate?
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Start Over", for: .normal)
        button.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Check Fit", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 20
        return button
    }()
    
    let stkView: UIStackView = {
        let stkView = UIStackView()
        stkView.translatesAutoresizingMaskIntoConstraints = false
        stkView.axis = .horizontal
        stkView.spacing = 20
        stkView.distribution = .fillEqually
        return stkView
    }()
    
    func setupViews() {
        stkView.addArrangedSubview(button1)
        stkView.addArrangedSubview(button2)
        contentView.backgroundColor = .white
        contentView.addSubview(stkView)
        stkView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        stkView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        stkView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30 ).isActive = true
        stkView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func startButtonPressed(){
        delegate?.startOverPressed()
    }
}
