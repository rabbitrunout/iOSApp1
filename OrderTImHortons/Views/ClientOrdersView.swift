import SwiftUI

struct ClientOrdersView: View {
    let employeeName: String
    let orders: [CoffeeOrder]

    var body: some View {
        List {
            ForEach(orders.sorted { $0.date > $1.date }) { order in
                HStack {
                    VStack(alignment: .leading) {
                        Text(order.coffeeType)
                            .font(.headline)
                        Text(Self.dateFormatter.string(from: order.date))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Image(systemName: order.iconName)
                        .foregroundColor(order.iconColor)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("\(employeeName)'s Orders")
    }

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}
