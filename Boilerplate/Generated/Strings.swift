import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension String {
    static let title = "title".localized
}
