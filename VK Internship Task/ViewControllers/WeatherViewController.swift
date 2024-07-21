//
//  ViewController.swift
//  VK Internship Task
//
//  Created by Dmitry Tkach on 17.07.2024.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let weatherManager = WeatherManager()
    
    private let sunController = SunController()
    private let cloudsController = CloudsController()
    private let fogController = FogController()
    private let rainController = RainController()
    
    private let weatherSelectorCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    private let backgroundImageView: UIImageView = {
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
        
        view.addSubview(weatherSelectorCollectionView)
        weatherSelectorCollectionView.delegate = self
        weatherSelectorCollectionView.dataSource = self
        weatherSelectorCollectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "condition")
        
        let inititalCondition = weatherManager.getCurrentWeatherCondition()
        
        switch inititalCondition {
        case .clear:
            break
        case .clouds:
            cloudsController.animateClouds(view: view)
        case .fog:
            fogController.animateFog(view: view)
        case .rain:
            rainController.animateRain(view: view)
        case .sun:
            sunController.animateSun(view: view)
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
            weatherSelectorCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherSelectorCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            weatherSelectorCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            weatherSelectorCollectionView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(backgroundImageViewConstraints)
        NSLayoutConstraint.activate(weatherSelectorConstraints)
    }
    
}

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Weather.WeatherConditions.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "condition", for: indexPath) as? WeatherCollectionViewCell else {
            return UICollectionViewCell()
        }
        let conditionsStrings = weatherManager.getConditionNames()
        
        cell.configure(with: conditionsStrings[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let conditions = weatherManager.getConditionNames()
        let cellCondition = Weather.WeatherConditions(rawValue: conditions[indexPath.row])
        
        switch weatherManager.getCurrentWeatherCondition() {
        case .rain:
            rainController.stopAnimating()
        case .clouds:
            cloudsController.stopAnimating()
        case .sun:
            sunController.stopAnimating()
        case .fog:
            fogController.stopAnimating()
        case .clear:
            break
        }
        
        weatherManager.setWeather(to: Weather.WeatherConditions(rawValue: conditions[indexPath.row])!)
        
        UIView.transition(with: backgroundImageView,
                          duration: 2,
                          options: [.curveEaseInOut, .transitionCrossDissolve],
                          animations: { self.backgroundImageView.image =  self.weatherManager.getCurrentWeatherBackground()},
                          completion: nil)
        
        switch cellCondition {
        case .clear:
            break
        case .clouds:
            cloudsController.animateClouds(view: view)
        case .fog:
            fogController.animateFog(view: view)
        case .rain:
            rainController.animateRain(view: view)
        case .sun:
            sunController.animateSun(view: view)
        case .none:
            break
        }
    }
    
}

