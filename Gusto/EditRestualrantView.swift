//
//  EditRestualrantView.swift
//  Gusto
//
//  Created by Suppasit chuwatsawat on 18/1/2567 BE.
//

import SwiftUI
import SwiftData

struct EditRestualrantView: View {
    var restuarant: Restuarant
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let containter = try! ModelContainer(for: Restuarant.self, configurations: config)
    let example = Restuarant(name: "Work this way", price: 100, quality: 5, speedRating: 5)
    return EditRestualrantView(restuarant: example)
        .modelContainer(containter)
}
