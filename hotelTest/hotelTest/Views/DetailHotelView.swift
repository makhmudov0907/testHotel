//
//  ContentView.swift
//  hotelTest
//
//  Created by Mirshod Makhmudov on 31/08/23.
//

import SwiftUI

struct DetailHotelView: View {
    let images = ["hotel1", "hotel2", "hotel3", "hotel4", "hotel5", "hotel6"]
    
    let aboutHotel = ["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа"]
    let rows: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil)
    ]
    
    var conditions: Conditions
    
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
                    
                    //stars
                    HStack {
                        Image(systemName: "star.fill")
                        Text("5 Превосходно")
                        Spacer()
                    }
                    .foregroundColor(.yellow)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .frame(maxWidth: 200, minHeight: 40)
                    .background(Color.yellow.opacity(0.3))
                    .background(in: RoundedRectangle(cornerRadius: 15))
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
                        HStack {
                            Text("от 134 673 $")
                                .font(.system(size: 30, weight: .bold, design: .default))
                                .padding(.top, 10)
                                .padding(.bottom, 15)
                            Text("за тур с перелетом")
                                .font(.system(size: 14, weight: .medium, design: .default))
                                .foregroundColor(.gray)
                            
                        }
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.3))
                .background(in: RoundedRectangle(cornerRadius: 15))
                
                
                Divider()
                    .frame(height: 10)
                    .overlay(Color.gray).opacity(0.1)
                    .padding(.top, -25)
                
                //об отеле
                LazyVGrid(
                    columns: rows,
                    alignment: .leading,
                    spacing: 6,
                    pinnedViews: [],
                    content: {
                        Section(header:
                                    Text("Об отеле")
                                        .font(.system(size: 22, weight: .bold, design: .default))
                                        .padding(.horizontal)
                                        .padding(.bottom, 15),
                                footer:
                                    Text("Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!")
                                        .padding()
                                        .font(.system(size: 16, weight: .regular, design: .default))
                        ) {
                            ForEach(aboutHotel, id: \.self) { index in
                                Text(index)
                                    .foregroundColor(.gray)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(Color.gray.opacity(0.2))
                                    .background(in: RoundedRectangle(cornerRadius: 15))
                            }
                            .padding(.horizontal)
                        }
                    })
                
                
                List {
                    ForEach(conditionsList, id: \.self) { condition in
                        NavigationLink(destination: DetailConditionsView(condition: condition)) {
                            Image(condition.image)
                                .resizable()
                                .frame(width: 24, height: 24)
                            VStack(alignment: .leading) {
                                Text(condition.name)
                                    .font(.title3)
                                Text("Самое необходимое")
                                    .font(.callout)
                                    .fontWeight(.light)
                            }
                            .padding(.horizontal)
                        }
                        .padding()
                        .listRowBackground(Color.gray.opacity(0.1))
                    }
                }
                .frame(height: 300)
                .cornerRadius(20)
                .listStyle(.plain)
                .padding()
                .clipped()
                
                
                Divider()
                    .frame(height: 15)
                    .overlay(Color.gray).opacity(0.1)
                    .padding(.top, -10)
                
                
                NavigationLink {
                    HotelRoomView()
                } label: {
                    Text("К выбору номера")
                        .frame(height: 35)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 18, weight: .bold, design: .default))
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding()
//                .buttonBorderShape(.capsule)

            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Отель")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct DetailHotelView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHotelView(conditions: conditionsList[0])
    }
}
