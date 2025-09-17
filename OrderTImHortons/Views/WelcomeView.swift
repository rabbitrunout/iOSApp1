import SwiftUI

struct WelcomeView: View {
    @ObservedObject var viewModel: OrderViewModel
    @State private var showOrders = false

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundColor(.red)

            Text("Welcome to Tim Hortons Orders")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Text("Easily add and manage your team's favorite coffee orders every day.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button(action: { showOrders = true }) {
                Text("Start Ordering ☕️")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
        }
        .padding()
        .navigationDestination(isPresented: $showOrders) {
            OrdersListView(viewModel: viewModel)
        }
    }
}

#Preview {
    NavigationStack {
        WelcomeView(viewModel: OrderViewModel())
    }
}
