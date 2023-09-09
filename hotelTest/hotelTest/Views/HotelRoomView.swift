//
//  HotelRoomView.swift
//  hotelTest
//
//  Created by Mirshod Makhmudov on 07/09/23.
//

import SwiftUI

struct HotelRoomView: View {
    let images = ["hotel4", "hotel3", "hotel5", "hotel6"]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    //slider
                    TabView {
                        ForEach(images, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .cornerRadius(20)
                        }
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .frame(height: 250)
                    Spacer()
                    
                    //name hotel
                    VStack(alignment: .leading) {
                        Text("Стандартный с видом на бассейн или сад")
                            .font(.system(size: 22, weight: .bold, design: .default))
                        
                        HStack(spacing: 40) {
                            Text("Все включено")
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(Color.gray.opacity(0.2))
                                .background(in: RoundedRectangle(cornerRadius: 15))
                            Text("Кондиционер")
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(Color.gray.opacity(0.2))
                                .background(in: RoundedRectangle(cornerRadius: 15))
                            Spacer()
                        }
                        HStack {
                            Text("Подробнее о номере")
                            Image(systemName: "chevron.right")
                        }
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .frame(maxWidth: 220, minHeight: 40)
                        .background(Color.blue.opacity(0.2))
                        .background(in: RoundedRectangle(cornerRadius: 15))
                        
                        HStack {
                            Text("от 186 600 $")
                                .font(.system(size: 30, weight: .bold, design: .default))
                                .padding(.top, 10)
                                .padding(.bottom, 15)
                            Text("за 7 ночей с перелетом")
                                .font(.system(size: 14, weight: .medium, design: .default))
                                .foregroundColor(.gray)
                            
                        }
                    }
                    NavigationLink {
                        BookingView()
                    } label: {
                        Text("Выбрать номер")
                            .frame(height: 35)
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 18, weight: .bold, design: .default))
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Steigenberger Makadi")
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
                .padding()
                
                
                Divider()
                    .frame(height: 15)
                    .overlay(Color.gray).opacity(0.1)
                    .padding(.top, -10)
                
            

            }
        }
    }
}

struct HotelRoomView_Previews: PreviewProvider {
    static var previews: some View {
        HotelRoomView()
    }
}
