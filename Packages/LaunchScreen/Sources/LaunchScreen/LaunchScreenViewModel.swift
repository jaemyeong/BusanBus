import Foundation
import Combine

public final class LaunchScreenViewModel: ObservableObject {
    
    @Published
    public var isLoading: Bool = false
    
    public var onInitializeSuccess: (() -> Void) = {}
    
    public var onInitializeFailure: ((Error) -> Void) = { _ in }
    
    private var initializeWork: Task<Void, Never>? {
        willSet {
            guard let initializeWork else {
                return
            }
            initializeWork.cancel()
        }
    }
    
    public init() {}
    
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
