import Foundation
import Combine

public final class LaunchScreenViewModel: ObservableObject {
    
    @Published
    public var isLoading: Bool = false
    
    private let onInitializeSuccess: (() -> Void)
    
    private let onInitializeFailure: ((Error) -> Void)
    
    private var initializeWork: Task<Void, Never>? {
        willSet {
            guard let initializeWork else {
                return
            }
            initializeWork.cancel()
        }
    }
    
    public init(onInitializeSuccess: @escaping () -> Void, onInitializeFailure: @escaping (Error) -> Void) {
        self.onInitializeSuccess = onInitializeSuccess
        self.onInitializeFailure = onInitializeFailure
    }
    
    @MainActor
    public func initialize() {
        self.initializeWork = Task {
            self.isLoading = true
            
            defer {
                self.isLoading = false
            }
            
            do {
                try await Task.sleep(nanoseconds: 2_000_000_000)
            } catch {
                logger.error("\(error)")
                self.onInitializeFailure(error)
                return
            }
            
            self.onInitializeSuccess()
        }
    }
}
