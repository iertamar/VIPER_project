//
//  Footer.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 09/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

protocol PushDelegate {
    func didTapOnFindInformation(_ title: String)
}

class Footer: UITableViewHeaderFooterView {
    
    var delegate: PushDelegate?
    
    let button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.text = "button1"
        button.titleLabel?.textColor = .black
        var attrs = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
        let buttonTitleStr = NSMutableAttributedString(string:"Where to find vehicle's information", attributes:attrs)
        var attributedString = NSMutableAttributedString(string:"")
        attributedString.append(buttonTitleStr)
        button.setAttributedTitle(attributedString, for: .normal)
        button.addTarget(self, action: #selector(footerButtonPressed), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        button.title
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
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(button1)
        contentView.backgroundColor = .white
        button1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        button1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35).isActive = true
        button1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35).isActive = true
        button1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func footerButtonPressed(){
        delegate?.didTapOnFindInformation("Find")
    }
}
