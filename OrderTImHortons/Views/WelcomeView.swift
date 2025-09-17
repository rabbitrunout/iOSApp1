//
//  WelcomeView.swift
//  OrderTImHortons
//
//  Created by Irina Saf on 2025-09-17.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            // Фон
            LinearGradient(
                gradient: Gradient(colors: [Color.red.opacity(0.9), Color.brown]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Логотип / иконка
                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                
                // Заголовок
                Text("Welcome to\nTim Hortons Orders")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                // Подзаголовок
                Text("Record your coffee runs\nand never forget an order again ☕️")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                // Кнопка "Начать"
                Button(action: {
                    print("Start tapped")
                }) {
                    Text("Start Ordering")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(.red)
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                }
                .shadow(radius: 5)
                
                Spacer().frame(height: 40)
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
