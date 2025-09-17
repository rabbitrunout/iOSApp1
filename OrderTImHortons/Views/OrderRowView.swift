import SwiftUI

struct OrderRowView: View {
    var order: CoffeeOrder

    var body: some View {
        VStack(spacing: 20) {
            Text(order.employeeName)
                .font(.largeTitle)
                .bold()

            Text(order.coffeeType)
                .font(.title2)
                .foregroundColor(.brown)

            Image(systemName: "cup.and.saucer.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundColor(.brown)

            Spacer()
        }
        .padding()
        .navigationTitle("Order Details")
    }
}

#Preview {
    OrderRowView(order: CoffeeOrder.sampleOrders[0])
}
