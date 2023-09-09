//
//  hotelTestApp.swift
//  hotelTest
//
//  Created by Mirshod Makhmudov on 31/08/23.
//

import SwiftUI

@main
struct hotelTestApp: App {
    var body: some Scene {
        WindowGroup {
            DetailHotelView(conditions: conditionsList[0])
        }
    }
}
