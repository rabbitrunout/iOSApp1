import SwiftUI

struct OrderDetailView: View {
    var order: CoffeeOrder
    @EnvironmentObject var viewModel: OrderViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Image(systemName: order.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(order.iconColor)
                
                Text(order.employeeName)
                    .font(.largeTitle)
                    .bold()
                
                Text(order.coffeeType)
                    .font(.title2)
                    .foregroundColor(.brown)
                
                Divider().padding(.vertical, 20)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("History for \(order.employeeName)")
                        .font(.headline)
                    
                    let clientOrders = viewModel.orders
                        .filter { $0.employeeName == order.employeeName }
                        .sorted { $0.date > $1.date }
                    
                    ForEach(clientOrders) { pastOrder in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(pastOrder.coffeeType)
                                    .font(.subheadline)
                                Text(Self.dateFormatter.string(from: pastOrder.date))
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: pastOrder.iconName)
                                .foregroundColor(pastOrder.iconColor)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                )
            }
            .padding()
        }
        .navigationTitle("Order Details")
    }
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}
