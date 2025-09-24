import SwiftUI

struct OrdersListView: View {
    @EnvironmentObject var viewModel: OrderViewModel
    @State private var showAddOrder = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.orders) { order in
                    NavigationLink(destination: OrderDetailView(order: order)) {
                        OrderCardView(order: order)
                    }
                }
                .onDelete { indexSet in
                    viewModel.deleteOrder(at: indexSet)  // 👈 IMPORTANT: we call the function explicitly
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Team Coffee Orders")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddOrder = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $showAddOrder) {
                AddOrderView()
            }
        }
    }
}

// MARK: - OrderCardView
struct OrderCardView: View {
    var order: CoffeeOrder

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(order.employeeName)
                    .font(.title2)
                    .bold()
                Text(order.coffeeType)
                    .font(.headline)
                    .foregroundColor(.brown)
            }
            Spacer()
            Image(systemName: order.iconName)
                .font(.title2)
                .foregroundColor(order.iconColor)
        }
        .padding(.vertical, 8)
    }
}
