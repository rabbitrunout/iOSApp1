import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = OrderViewModel()

    var body: some View {
        TabView {
            WelcomeView()
                .tabItem {
                    Label("Welcome", systemImage: "house")
                }

            OrdersListView()
                .tabItem {
                    Label("Orders", systemImage: "list.bullet")
                }

            AddOrderView()
                .tabItem {
                    Label("Add", systemImage: "plus.circle")
                }

            OrdersHistoryView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
