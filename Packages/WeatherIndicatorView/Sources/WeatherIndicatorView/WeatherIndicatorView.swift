import UIKit

import os

import OpenColorKit

import ErrorKit

public final class WeatherIndicatorView: UIView {
    private let imageView: UIImageView
    
    private let textLabel: UILabel
    
    private let blurEffectView: UIVisualEffectView
    
    private let vibrancyEffectView: UIVisualEffectView
    
    public override init(frame: CGRect) {
        self.textLabel = UILabel(frame: frame)
        
        self.imageView = UIImageView(
            image: UIImage(
                systemName: "sun.min",
                withConfiguration: UIImage.SymbolConfiguration(
                    font: .preferredFont(
                        forTextStyle: .headline
                    ),
                    scale: .large
                )
            )
        )
        
        
        let blurEffect = UIBlurEffect(style: .systemThinMaterial)
        
        let vibrancyEffect: UIVibrancyEffect = UIVibrancyEffect(
            blurEffect: blurEffect,
            style: .fill
        )
        
        self.blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        self.vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        
        super.init(frame: frame)
        
        self.configureView()
        self.configureViewHierarchy()
        self.configureLayoutConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError(String(describing: InstantiateError()))
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 96.0, height: 48.0)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = (self.bounds.height - 8.0) / 2.0
    }
}

extension WeatherIndicatorView {
    private func configureView() {
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.openColor.gray.gray3.color?.cgColor
    }
    
    private func configureViewHierarchy() {
        self.addSubview(self.blurEffectView)
        self.blurEffectView.contentView.addSubview(self.vibrancyEffectView)
        self.vibrancyEffectView.contentView.addSubview(self.imageView)
    }
    
    private func configureLayoutConstraints() {
        let imageView = self.imageView
        
        let blurEffectView = self.blurEffectView
        
        let vibrancyEffectView = self.vibrancyEffectView
        
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            blurEffectView.topAnchor.constraint(equalTo: self.topAnchor),
            blurEffectView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: blurEffectView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: blurEffectView.bottomAnchor)
        ])
        
        vibrancyEffectView.translatesAutoresizingMaskIntoConstraints = false
        
        blurEffectView.contentView.addConstraints([
            vibrancyEffectView.topAnchor.constraint(equalTo: blurEffectView.contentView.topAnchor),
            vibrancyEffectView.leadingAnchor.constraint(equalTo: blurEffectView.contentView.leadingAnchor),
            blurEffectView.contentView.trailingAnchor.constraint(equalTo: vibrancyEffectView.trailingAnchor),
            blurEffectView.contentView.bottomAnchor.constraint(equalTo: vibrancyEffectView.bottomAnchor)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            imageView.centerXAnchor.constraint(equalTo: vibrancyEffectView.contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: vibrancyEffectView.contentView.centerYAnchor)
        ])
    }
}
