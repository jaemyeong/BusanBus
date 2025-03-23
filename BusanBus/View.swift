import UIKit

public final class View: UIView {
    
    private let textLabel: UILabel
    
    public override init(frame: CGRect) {
        self.textLabel = UILabel()
        
        super.init(frame: frame)
        
        self.accessibilityIdentifier = "View"
        self.backgroundColor = .systemBackground
        
        self.textLabel.accessibilityIdentifier = "textLabel"
        self.textLabel.text = "Hello, World!"
        self.textLabel.textColor = .label
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.textLabel)
        
        NSLayoutConstraint.activate([
            self.textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError()
    }
}

#Preview {
    View()
}
