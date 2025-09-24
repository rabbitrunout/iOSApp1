import SwiftUI

struct OrdersHistoryView: View {
    @EnvironmentObject var viewModel: OrderViewModel

    var groupedOrders: [(key: String, value: [CoffeeOrder])] {
        let grouped = Dictionary(grouping: viewModel.orders) { order in
            Self.dateLabel(for: order.date)
        }
        return grouped.sorted { $0.key > $1.key }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(groupedOrders, id: \.key) { dateKey, orders in
                    Section(header: Text(dateKey).font(.headline)) {
                        ForEach(orders) { order in
                            NavigationLink(destination: ClientOrdersView(
                                employeeName: order.employeeName,
                                orders: viewModel.orders.filter { $0.employeeName == order.employeeName }
                            )) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(order.employeeName)
                                            .font(.body)
                                            .bold()
                                        Text(order.coffeeType)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                    Image(systemName: order.iconName)
                                        .foregroundColor(order.iconColor)
                                }
                                .padding(.vertical, 6)
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                let orderToDelete = orders[index]
                                viewModel.deleteOrder(orderToDelete)  // 👈 deleting a specific order
                            }
                        }
                    }
                }
            }
            .navigationTitle("History")
        }
    }

    private static func dateLabel(for date: Date) -> String {
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: date)
        }
    }
}
