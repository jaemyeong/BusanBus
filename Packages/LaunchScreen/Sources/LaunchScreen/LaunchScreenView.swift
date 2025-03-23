import UIKit

public final class LaunchScreenView: UIView {
    
    private let activityIndicatorView: UIActivityIndicatorView
    
    public var isLoading: Bool = false {
        didSet {
            if self.isLoading {
                self.activityIndicatorView.startAnimating()
            } else {
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
    
    public override init(frame: CGRect) {
        self.activityIndicatorView = UIActivityIndicatorView(style: .large)
        
        super.init(frame: frame)
        
        self.accessibilityIdentifier = "LaunchScreenView"
        self.backgroundColor = .systemBackground
        
        self.activityIndicatorView.accessibilityIdentifier = "activityIndicatorView"
        self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.activityIndicatorView)
        
        NSLayoutConstraint.activate([
            self.activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError()
    }
}

#Preview("isLoading") {
    let view = LaunchScreenView()
    
    view.isLoading = true
    
    return view
}

#Preview("isNotLoading") {
    let view = LaunchScreenView()
    
    view.isLoading = false
    
    return view
}
