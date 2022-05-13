import UIKit

import WeatherIndicatorView

import NMapsMap

import OpenColorKit

import ErrorKit

public final class MainView: UIView {
    private let statusBar: UIVisualEffectView
    
    private let separator: UIView
    
    private let weatherIndicatorView: WeatherIndicatorView
    
    public let mapView: NMFMapView
    
    public override init(frame: CGRect) {
        self.mapView = NMFMapView(frame: frame)
        
        self.statusBar = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        
        self.separator = UIView(frame: frame)
        
        self.weatherIndicatorView = WeatherIndicatorView(frame: frame)
        
        super.init(frame: frame)
        
        self.configureView()
        
        self.configureSeparator()
        
        self.configureViewHierarchy()
        
        self.configureLayoutConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
}

extension MainView {
    private func configureView() {
        self.backgroundColor = .systemBackground
    }
    
    private func configureSeparator() {
        let separator = self.separator
        separator.backgroundColor = .openColor.gray.gray3.color
    }
    
    private func configureViewHierarchy() {
        self.addSubview(self.mapView)
        self.addSubview(self.weatherIndicatorView)
        self.addSubview(self.statusBar)
        self.addSubview(self.separator)
    }
    
    private func configureLayoutConstraints() {
        let mapView = self.mapView
        
        let weatherIndicatorView = self.weatherIndicatorView
        
        let statusBar = self.statusBar
        
        let separator = self.separator
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            mapView.topAnchor.constraint(equalTo: self.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: mapView.bottomAnchor)
        ])
        
        statusBar.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            statusBar.topAnchor.constraint(equalTo: self.topAnchor),
            statusBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: statusBar.trailingAnchor),
            self.safeAreaLayoutGuide.topAnchor.constraint(equalTo: statusBar.bottomAnchor)
        ])
        
        weatherIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            weatherIndicatorView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8.0),
            self.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: weatherIndicatorView.trailingAnchor, constant: 8.0)
        ])
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            separator.leadingAnchor.constraint(equalTo: statusBar.leadingAnchor),
            statusBar.trailingAnchor.constraint(equalTo: separator.trailingAnchor),
            statusBar.bottomAnchor.constraint(equalTo: separator.bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
}
