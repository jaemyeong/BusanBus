import UIKit
import Combine

public final class LaunchScreenViewController: UIViewController {
    
    private let viewModel: LaunchScreenViewModel
    
    public var contentView: LaunchScreenView {
        assert(self.view is LaunchScreenView)
        return self.view as! LaunchScreenView
    }
    
    private var cancellables: Set<AnyCancellable> = []
    
    public init(viewModel: LaunchScreenViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func loadView() {
        self.view = LaunchScreenView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel
            .$isLoading
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                guard let self else {
                    return
                }
                self.contentView.isLoading = value
            }
            .store(in: &self.cancellables)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.viewModel.initialize()
    }
}

#Preview {
    let viewModel = LaunchScreenViewModel()
    
    LaunchScreenViewController(viewModel: viewModel)
}
