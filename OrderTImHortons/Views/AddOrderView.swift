import SwiftUI

struct AddOrderView: View {
    @ObservedObject var viewModel: OrderViewModel
    @Environment(\.dismiss) var dismiss

    @State private var employeeName: String = ""
    @State private var selectedCoffee: CoffeeOrder.CoffeeType = .latte

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Employee")) {
                    TextField("Enter name", text: $employeeName)
                }

                Section(header: Text("Coffee Type")) {
                    Picker("Select coffee", selection: $selectedCoffee) {
                        ForEach(CoffeeOrder.CoffeeType.allCases, id: \.self) { coffee in
                            Text(coffee.rawValue).tag(coffee)
                        }
                    }
                    .pickerStyle(.menu)
                }

                Section {
                    Button("Save Order") {
                        let newOrder = CoffeeOrder(
                            id: UUID(),
                            employeeName: employeeName,
                            coffeeType: selectedCoffee.rawValue
                        )
                        viewModel.addOrder(newOrder)
                        dismiss()
                    }
                    .disabled(employeeName.isEmpty)
                }
            }
            .navigationTitle("Add New Order")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    AddOrderView(viewModel: OrderViewModel())
}
