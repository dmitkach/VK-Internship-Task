//
//  WeatherCollectionViewCell.swift
//  VK Internship Task
//
//  Created by Dmitry Tkach on 18.07.2024.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    lazy var weatherConditionLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        contentView.addSubview(weatherConditionLabel)
        
        contentView.backgroundColor = .gray
    }
    
    private func setConstraints() {
        let labelConstraints = 
        [
            weatherConditionLabel.topAnchor.constraint(equalTo: topAnchor),
            weatherConditionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            weatherConditionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherConditionLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(labelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
