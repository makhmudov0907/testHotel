//
//  DetailConditionsView.swift
//  hotelTest
//
//  Created by Mirshod Makhmudov on 07/09/23.
//

import SwiftUI

struct DetailConditionsView: View {
    var condition: Conditions
    
    var body: some View {
        Text(condition.name)
    }
}

struct DetailConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailConditionsView(condition: conditionsList[0])
    }
}
