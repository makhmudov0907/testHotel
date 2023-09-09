//
//  DetailTouristView.swift
//  hotelTest
//
//  Created by Mirshod Makhmudov on 09/09/23.
//

import SwiftUI


struct DropdownMenuItemView: View {
    @Binding var isSelecting: Bool
    @Binding var selectionTitle: String
    @Binding var selectionId: Int
    
    var body: some View {
        Button {
            isSelecting = false
        } label: {
            HStack {
                Image(systemName: "checkmark")
                    .font(.system(size: 14, weight: .bold))
                Spacer()
            }
            .padding()
            .foregroundColor(.black)
        }

    }
}

struct CustomDropdownMenu: View {
    @FocusState private var amountIsFocused: Bool
    @State private var name: String = ""
    @State private var secondName: String = ""
    @State private var date: String = ""
    @State private var citizenship: String = ""
    @State private var foreignPassportNumber: String = ""
    @State private var validityForeignPassportNumber: String = ""
    
    @State private var touristsField: [String] = []
    @State private var counter = 1
    
    
    @State var isSelecting = false
    @State var selectedRowId = 0
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("1 турист")
                        .font(.system(size: 22, weight: .semibold, design: .rounded))
                    
                    Spacer()
                    Image(systemName: "chevron.down.square.fill")
                        .resizable()
                        .font(.system(size: 16, weight: .regular))
                        .rotationEffect(.degrees(isSelecting ? -180 : 0))
                        .foregroundColor(Color.blue)
                        .frame(width: 32, height: 32)
                }
                .padding(.horizontal)
                .foregroundColor(Color.black)
                
                if isSelecting {
                    VStack {
                        TextField("Имя", text: $name)
                            .focused($amountIsFocused)
                            .keyboardType(.default)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .onTapGesture {}
                        TextField("Фамилия", text: $secondName)
                            .focused($amountIsFocused)
                            .keyboardType(.default)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .onTapGesture {}
                        TextField("Дата рождения", text: $date)
                            .focused($amountIsFocused)
                            .keyboardType(.decimalPad)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .onTapGesture {}
                        TextField("Гражданство", text: $citizenship)
                            .focused($amountIsFocused)
                            .keyboardType(.default)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .onTapGesture {}
                        TextField("Номер загранпаспорта", text: $foreignPassportNumber)
                            .focused($amountIsFocused)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .onTapGesture {}
                        TextField("Срок действия загранпаспорта", text: $validityForeignPassportNumber)
                            .focused($amountIsFocused)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .onTapGesture {}
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(Color(uiColor: UIColor.systemBackground))
            .cornerRadius(5)
            .onTapGesture {
                isSelecting.toggle()
            }
            .onAppear {
                selectedRowId = 1
            }
            .animation(.easeInOut(duration: 0.3))
            
            // добавление туристов
            VStack(alignment: .leading) {
                ForEach(0..<touristsField.count, id: \.self) { index in
                    HStack {
                        Text("\(index+2) турист ")
                            .font(.system(size: 22, weight: .bold, design: .default))
                        Spacer()
                        Image(systemName: "chevron.down.square.fill")
                            .resizable()
                            .font(.system(size: 16, weight: .regular))
                            .rotationEffect(.degrees(isSelecting ? -180 : 0))
                            .foregroundColor(Color.blue)
                            .frame(width: 32, height: 32)
                    }
                    .padding(.horizontal)
                    .foregroundColor(Color.black)
                    if isSelecting {
                        VStack {
                            TextField("Имя", text: $name)
                                .focused($amountIsFocused)
                                .keyboardType(.default)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .onTapGesture {}
                            TextField("Фамилия", text: $secondName)
                                .focused($amountIsFocused)
                                .keyboardType(.default)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .onTapGesture {}
                            TextField("Дата рождения", text: $date)
                                .focused($amountIsFocused)
                                .keyboardType(.decimalPad)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .onTapGesture {}
                            TextField("Гражданство", text: $citizenship)
                                .focused($amountIsFocused)
                                .keyboardType(.default)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .onTapGesture {}
                            TextField("Номер загранпаспорта", text: $foreignPassportNumber)
                                .focused($amountIsFocused)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .onTapGesture {}
                            TextField("Срок действия загранпаспорта", text: $validityForeignPassportNumber)
                                .focused($amountIsFocused)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .onTapGesture {}
                        }
                    }
                    
                }
                .onTapGesture {
                    isSelecting.toggle()
                }
                .onAppear {
                    selectedRowId = 1
                }
                .animation(.easeInOut(duration: 0.3))
                
                // кнопка добавления туристов
                Button {
                    touristsField.append("Турист \(counter)")
                    counter += 1
                } label: {
                    HStack {
                        Text("Добавить туриста")
                            .foregroundColor(.black)
                            .font(.system(size: 22, weight: .bold, design: .default))
                        Spacer()
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    .padding()
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(10)
                }
            }
            
        }
            
        
        
    }
}
struct TouristView: View {
    var name: String

    var body: some View {
        VStack {
            Text(name)
                .font(.system(size: 22, weight: .bold, design: .default))
                .padding(.horizontal)
                .padding(.top, 10)

            TextField("Имя", text: .constant(""))
                .font(.system(size: 22, weight: .bold, design: .default))
                .padding(.horizontal)
                .padding(.top, 10)
        }
    }
}

struct CustomDropdownMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDropdownMenu()
            .padding()
    }
}
