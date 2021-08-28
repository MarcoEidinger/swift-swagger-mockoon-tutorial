import Foundation

extension Optional where Wrapped == String {
    var asStringOrNilText: String {
        switch self {
            case .some(let value):
                return String(describing: value)
            case _:
                return "nil"
        }
      }
}
