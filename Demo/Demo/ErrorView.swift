import SwiftUI

enum AppError: Error {
    case fake
}

struct ErrorView: View {
    var error: Error
    var body: some View {
        Text(error.localizedDescription).background(Color.red).foregroundColor(Color.white)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: AppError.fake)
    }
}
