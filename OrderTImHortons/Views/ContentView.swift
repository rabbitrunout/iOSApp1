import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: OrderViewModel

    var body: some View {
        NavigationStack {
            TabView {
                WelcomeView(viewModel: viewModel)
                OrdersListView(viewModel: viewModel)
                AddOrderView(viewModel: viewModel)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        }
    }
}

#Preview {
    ContentView(viewModel: OrderViewModel())
}
