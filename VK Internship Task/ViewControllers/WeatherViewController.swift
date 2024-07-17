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
        
        return stackView
    }()
    
    var temperatureLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(32)
        
        return label
    }()
    
    var tempratureStepper: UIStepper = {
        let stepper = UIStepper()
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.stepValue = 0.1
        stepper.minimumValue = 16.0
        stepper.maximumValue = 35.0
        
        return stepper
    }()
    
    var windSpeedLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(16)
        
        return label
    }()
    
    var windSpeedStepper: UIStepper = {
        let stepper = UIStepper()
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.stepValue = 0.1
        stepper.minimumValue = 0.0
        stepper.maximumValue = 8.0
        
        return stepper
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
    }
    
    private func setConstraints() {
        let backgroundImageViewConstraints = [
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(backgroundImageViewConstraints)
    }

}

