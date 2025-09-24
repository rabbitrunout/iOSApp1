import SwiftUI

struct AddOrderView: View {
    @EnvironmentObject var viewModel: OrderViewModel
    @Environment(\.dismiss) private var dismiss   // для закрытия Sheet
    
    @State private var employeeName: String = ""
    @State private var selectedCoffee: String = "Latte"
    @State private var showToast = false          // 👈 состояние для тоста
    
    let coffeeTypes = ["Latte", "Cappuccino", "Espresso", "Americano", "Mocha"]
    
    var body: some View {
        ZStack {
            NavigationView {
                Form {
                    Section(header: Text("Employee")) {
                        TextField("Enter name", text: $employeeName)
                    }
                    
                    Section(header: Text("Coffee Type")) {
                        Picker("Select coffee", selection: $selectedCoffee) {
                            ForEach(coffeeTypes, id: \.self) { coffee in
                                Text(coffee).tag(coffee)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Button(action: addOrder) {
                        Text("Add Order")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(employeeName.isEmpty)
                }
                .navigationTitle("New Order")
            }
            
            // 👇 Toast поверх всего
            if showToast {
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.white)
                        Text("Order Accepted ✅")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding()
                    .background(Color.green.opacity(0.9))
                    .cornerRadius(12)
                    .shadow(radius: 10)
                    .padding(.bottom, 40)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                .animation(.easeInOut, value: showToast)
            }
        }
    }
    
    private func addOrder() {
        let newOrder = CoffeeOrder(employeeName: employeeName, coffeeType: selectedCoffee)
        viewModel.addOrder(newOrder)
        
        // сброс формы
        employeeName = ""
        selectedCoffee = coffeeTypes.first ?? "Latte"
        
        // показать toast
        showToast = true
        
        // закрыть toast и форму через 2 секунды
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                showToast = false
            }
            dismiss() // закрыть AddOrderView → вернуться к списку
        }
    }
}
