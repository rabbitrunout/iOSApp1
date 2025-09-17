import SwiftUI

struct OrderDetailView: View {
    var order: CoffeeOrder
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "cup.and.saucer.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.brown)
            
            Text(order.employeeName)
                .font(.largeTitle)
                .bold()
            
            Text(order.coffeeType)
                .font(.title2)
                .foregroundColor(.brown)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Order Details")
    }
}
