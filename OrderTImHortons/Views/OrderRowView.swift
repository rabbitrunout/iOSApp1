import SwiftUI

struct OrderRowView: View {
    var order: CoffeeOrder
    
    var body: some View {
        VStack(spacing: 10) {
            Text(order.employeeName)
                .font(.title2)
                .bold()
            Text(order.coffeeType)
                .font(.headline)
                .foregroundColor(.brown)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

// Превью
#Preview {
    OrderRowView(order: CoffeeOrder.sampleOrders[0])
}
