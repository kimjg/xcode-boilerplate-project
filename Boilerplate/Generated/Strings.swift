import Foundation
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
enum Strings {
    static let title = "title".localized
}
