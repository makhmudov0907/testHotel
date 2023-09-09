//
//  NotificationView.swift
//  hotelTest
//
//  Created by Mirshod Makhmudov on 09/09/23.
//

import SwiftUI


struct NotificationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            Spacer()
            VStack(alignment: .center) {
                Image("hug")
                    .resizable()
                    .frame(width: 94, height: 94, alignment: .center)
                    .padding(.bottom)
                Text("Ваш заказ принят в работу")
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.center)
                Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                    .font(.system(size: 16, weight: .light))
                    .padding()
                    .multilineTextAlignment(.center)
                
            }
            .padding()
            
            Spacer()
            Divider()
                .frame(height: 2)
                .overlay(Color.gray).opacity(0.1)

            NavigationLink {
                DetailHotelView(conditions: conditionsList[0])
            } label: {
                Text("Супер!")
                    .frame(height: 35)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 18, weight: .bold, design: .default))
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Заказ оплачен")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
