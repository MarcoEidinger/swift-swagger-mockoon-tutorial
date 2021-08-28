import SwiftUI
import Alamofire

struct ContentView: View {

    @State var model: InlineResponse200?
    @State var error: Error?

    var body: some View {
        VStack(spacing: 30) {
            if let error = self.error {
                ErrorView(error: error)
            }
            if let model = self.model {
                Text("Hi, your IP address is \(model.ipAddress.asStringOrNilText) and you are located in \(model.city.asStringOrNilText), a city in the wonderful country \(model.country.asStringOrNilText)")
            } else {
                Button("Get Data") {
                    self.error = nil
                    // call mock backend
                    SwaggerClientAPI.basePath = "http://localhost:3000"
                    // Swagger-Codegen generated API
                    DefaultAPI.v1Get(apiKey: "fakeApiKey", ipAddress: getPublicIPAddress()) { possibleResponse, possibleError in
                        if let error = possibleError { self.error = error }
                        self.model = possibleResponse
                    }
                }
            }
        }.padding()
    }

    func getPublicIPAddress() -> String {
        let address = try? String(contentsOf: URL(string: "https://api.ipify.org")!, encoding: .utf8)
        return address ?? "ERROR"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
