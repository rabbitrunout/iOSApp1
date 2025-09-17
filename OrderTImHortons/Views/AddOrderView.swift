//
//  AddOrderView.swift
//  OrderTImHortons
//
//  Created by Irina Saf on 2025-09-17.
//

import SwiftUI

struct AddOrderView: View {
    @ObservedObject var viewModel: OrderViewModel
    @State private var name = ""
    @State private var coffee = "Latte"
    @State private var errorMessage = ""
    
    let coffeeOptions = ["Latte", "Cappuccino", "Espresso", "Americano", "Mocha"]
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Employee's name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Picker("Choose a coffee", selection: $coffee) {
                ForEach(coffeeOptions, id: \.self) { type in
                    Text(type).tag(type)
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 150)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
            Button("Save the order") {
                addOrderIfValid()
            }
            .padding()
            .background(Color.blue.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
    
    private func addOrderIfValid() {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Enter the employee's name"
            return
        }
        
        viewModel.addOrder(name: name, coffee: coffee)
        name = ""
        coffee = "Latte"
        errorMessage = ""
    }
}

// Превью
#Preview {
    AddOrderView(viewModel: OrderViewModel())
}
