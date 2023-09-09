//
//  BookingView.swift
//  hotelTest
//
//  Created by Mirshod Makhmudov on 08/09/23.
//

import SwiftUI

struct BookingView: View {
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @FocusState private var amountIsFocused: Bool
    @State private var touristsField: [String] = []
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Divider()
                    .frame(height: 10)
                    .overlay(Color.gray).opacity(0.1)
                    .padding(.top, 10)
                
                VStack(alignment: .leading) {
                    //stars
                    HStack(spacing: 5) {
                        Image(systemName: "star.fill")
                        Text("5 Превосходно")
                        Spacer()
                    }
                    .foregroundColor(.yellow)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .frame(maxWidth: 190, minHeight: 40)
                    .background(Color.yellow.opacity(0.3))
                    .background(in: RoundedRectangle(cornerRadius: 5))
                    .padding(.top, 10)
                    
                    //name hotel
                    VStack(alignment: .leading) {
                        Text("Steigenberger Makadi")
                            .font(.system(size: 22, weight: .bold, design: .default))
                            .padding(.bottom, 5)
                            .padding(.top, 5)
                        Text("Madinat Makadi, Safaga Road, Makadi Bay, Египет")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.blue)
                    }
                }
                
                Divider()
                    .frame(height: 10)
                    .overlay(Color.gray).opacity(0.1)
                    .padding(.top, 10)
                
                // таблица
                Grid(alignment: .topLeading, horizontalSpacing: 28, verticalSpacing: 10) {
                    GridRow {
                        Text("Вылет из")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Text("Санкт-Питербург")
                    }
                    .gridCellColumns(2)
                    GridRow {
                        Text("Страна, город")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Text("Египет, Хургада")
                    }
                    .gridCellColumns(2)
                    GridRow {
                        Text("Даты")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Text("19.09.2023-27.09.2023")
                    }
                    .gridCellColumns(2)
                    GridRow {
                        Text("Кол-во ночей")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Text("7 ночей")
                    }
                    .gridCellColumns(2)
                    GridRow {
                        Text("Отель")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Text("Steigenberger Makadi")
                    }
                    .gridCellColumns(2)
                    GridRow {
                        Text("Номер")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Text("Стандартный с видом на бассейн или сад")
                    }
                    .gridCellColumns(2)
                    GridRow {
                        Text("Питание")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Text("Все включено")
                    }
                    .gridCellColumns(2)
                }
                
                
                Divider()
                    .frame(height: 10)
                    .overlay(Color.gray).opacity(0.1)
                    .padding(.top, 10)
                
                //информация о покупателе
                VStack(alignment: .leading) {
                    Text("Информация о покупателе")
                        .font(.system(size: 22, weight: .bold, design: .default))
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    TextField("Номер телефона", text: $phoneNumber)
                        .focused($amountIsFocused)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    TextField("Почта", text: $email)
                        .focused($amountIsFocused)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                        .padding(.horizontal, 15)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(.gray)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
                .onAppear {
                    UITextField.appearance().clearButtonMode = .whileEditing
                }
                
                
                CustomDropdownMenu()
                
                
                Divider()
                    .frame(height: 10)
                    .overlay(Color.gray).opacity(0.1)
                    .padding(.top, 10)
                
                // таблица
                Grid(alignment: .topLeading, horizontalSpacing: 100, verticalSpacing: 10) {
                    GridRow {
                        Text("Тур")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Text("186 600$")
                    }
                    .gridCellColumns(2)
                    GridRow {
                        Text("Топливный сбор")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Text("9 300$")
                    }
                    .gridCellColumns(2)
                    GridRow {
                        Text("Сервисный сбор")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Text("2 136$")
                    }
                    .gridCellColumns(2)
                    GridRow {
                        Text("К оплате")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Text("198 036$")
                            .foregroundColor(Color.blue)
                    }
                    .gridCellColumns(2)
                }
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Бронирование")
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
                
                NavigationLink {
                    NotificationView()
                } label: {
                    Text("Выбрать номер")
                        .frame(height: 35)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 18, weight: .bold, design: .default))
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding()
                
                
            }
        }
        
        
        
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
