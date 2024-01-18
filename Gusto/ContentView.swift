//
//  ContentView.swift
//  Gusto
//
//  Created by Suppasit chuwatsawat on 18/1/2567 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var restuarants: [Restuarant]
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(restuarants) { restuarant in
                    NavigationLink(value: restuarant) {
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Text("\(restuarant.name)")
                                Spacer()
                            }
                            HStack(alignment: .top) {
                                Text("price: \(restuarant.price)")
                                    .font(.caption)
                                Text("quality: \(restuarant.quality)")
                                    .font(.caption)
                                Text("speed: \(restuarant.speedRating)")
                                    .font(.caption)
                                Text("avg: \(restuarant.average)")
                                    .font(.caption)
                            }
                        }
                    }
                    .navigationDestination(for: Restuarant.self) { restuarant in
                        EditRestualrantView(restuarant: restuarant)
                    }
                }
                .onDelete { indexSet in
                    for item in indexSet {
                        let object = restuarants[item]
                        modelContext.delete(object)
                    }
                }
            }
            .toolbar {
                /*
                 • Thyme Square 
                 • Pasta la Vista
                 • Life of Pie
                 • Lord of the Wings
                 */
                ToolbarItemGroup {
                    Button("Add") {
                        let workThisWay = Restuarant(name: "Work this way", price: 100, quality: 5, speedRating: 5)
                        let pasta = Restuarant(name: "Pasta la Vista", price: 70, quality: 5, speedRating: 3)
                        let lifeOfPie = Restuarant(name: "Life of Pie", price: 60, quality: 7, speedRating: 5)
                        let lordOfWings = Restuarant(name: "Lord of the Wings", price: 166, quality: 3, speedRating: 5)
                        modelContext.insert(workThisWay)
                        modelContext.insert(pasta)
                        modelContext.insert(lifeOfPie)
                        modelContext.insert(lordOfWings)
                    }
                }
            }
        }
    }
}

#Preview {
//    ContentView()
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let containter = try! ModelContainer(for: Restuarant.self, configurations: config)
    let example = Restuarant(name: "Work this way", price: 100, quality: 5, speedRating: 5)
    return ContentView()
        .modelContainer(containter)
}
