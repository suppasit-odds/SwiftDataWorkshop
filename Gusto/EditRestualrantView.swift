//
//  EditRestualrantView.swift
//  Gusto
//
//  Created by Suppasit chuwatsawat on 18/1/2567 BE.
//

import SwiftUI
import SwiftData

struct EditRestualrantView: View {
    @Bindable var restuarant: Restuarant
    
    var body: some View {
        Form {
            TextField("Name fo restuarant", text: $restuarant.name)
            Picker("Price", selection: $restuarant.price) {
                ForEach(1..<10) {
                    Text("\($0)").tag($0)
                }
            }
            Picker("Quality", selection: $restuarant.quality) {
                ForEach(1..<6) {
                    Text("\($0)").tag($0)
                }
            }
            Picker("Speed Rating", selection: $restuarant.speedRating) {
                ForEach(1..<6) {
                    Text("\($0)").tag($0)
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let containter = try! ModelContainer(for: Restuarant.self, configurations: config)
    let example = Restuarant(name: "Work this way", price: 100, quality: 5, speedRating: 5)
    return EditRestualrantView(restuarant: example)
        .modelContainer(containter)
}
