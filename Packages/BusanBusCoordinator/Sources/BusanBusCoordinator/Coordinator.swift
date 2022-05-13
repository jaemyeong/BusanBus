import Foundation

public protocol Coordinator: AnyObject, Identifiable {
    var children: [AnyHashable: AnyObject] { get }
}
