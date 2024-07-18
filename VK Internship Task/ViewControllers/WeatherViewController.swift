//
//  ViewController.swift
//  VK Internship Task
//
//  Created by Dmitry Tkach on 17.07.2024.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherManager = WeatherManager()
    
    var weatherSelectorStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        
        return stackView
    }()
    
    var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.image = weatherManager.getCurrentWeatherBackground()
        
        setupWeatherSelector()
        view.addSubview(weatherSelectorStackView)
    }
    
    private func setupWeatherSelector() {
        let conditionNames = weatherManager.getConditionNames()
        
        for name in conditionNames {
            let button = UIButton()
            
            button.setTitle(name, for: .normal)
            button.layer.cornerRadius = 16
            button.addTarget(self, action: #selector(weatherSelectorButtonPressed), for: .touchUpInside)
            
            let currentCondition = weatherManager.getCurrentWeatherCondition()
            
            if name == currentCondition.rawValue {
                button.backgroundColor = .darkGray
            } else {
                button.backgroundColor = .gray
            }
            
            weatherSelectorStackView.addArrangedSubview(button)
        }
    }
    
    private func setConstraints() {
        let backgroundImageViewConstraints = [
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ],
        weatherSelectorConstraints =
        [
            weatherSelectorStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherSelectorStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            weatherSelectorStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            weatherSelectorStackView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(backgroundImageViewConstraints)
        NSLayoutConstraint.activate(weatherSelectorConstraints)
    }
    
    @objc func weatherSelectorButtonPressed(_ sender: UIButton) {
        let choosedCondition = sender.titleLabel?.text
        let currentCondition = weatherManager.getCurrentWeatherCondition()
        
        if choosedCondition != currentCondition.rawValue {
            weatherSelectorStackView.arrangedSubviews.forEach({ view in
                view.backgroundColor = .gray
            })
            sender.backgroundColor = .darkGray
            weatherManager.setWeather(to: Weather.WeatherConditions(rawValue: choosedCondition!)!)
            backgroundImageView.image = weatherManager.getCurrentWeatherBackground()
        }
    }
    
}

