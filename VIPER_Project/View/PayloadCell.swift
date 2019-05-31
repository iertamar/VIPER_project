//
//  PayloadCell.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 09/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

class payloadCell1: UITableViewCell {
    var label: UILabel = {
        let label = UILabel()
        label.text = "byDefault"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLayout() {
        contentView.addSubview(label)
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant : 20).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant : -20).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
}
