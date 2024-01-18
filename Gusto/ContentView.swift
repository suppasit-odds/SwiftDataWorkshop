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
    @State var path = [Restuarant]()
    
    var body: some View {
        NavigationStack(path: $path) {
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
                }
                .onDelete { indexSet in
                    for item in indexSet {
                        let object = restuarants[item]
                        modelContext.delete(object)
                    }
                }
            }
            .navigationDestination(for: Restuarant.self) { restuarant in
                EditRestualrantView(restuarant: restuarant)
            }
            .toolbar {
                ToolbarItemGroup {
                    Button("Add Sample") {
                        let workThisWay = Restuarant(name: "Work this way", price: 9, quality: 5, speedRating: 5)
                        let pasta = Restuarant(name: "Pasta la Vista", price: 7, quality: 5, speedRating: 3)
                        let lifeOfPie = Restuarant(name: "Life of Pie", price: 6, quality: 7, speedRating: 5)
                        let lordOfWings = Restuarant(name: "Lord of the Wings", price: 9, quality: 3, speedRating: 5)
                        modelContext.insert(workThisWay)
                        modelContext.insert(pasta)
                        modelContext.insert(lifeOfPie)
                        modelContext.insert(lordOfWings)
                    }
                    Spacer()
                    Button("Add") {
                        let restuarant = Restuarant(name: "", price: 1, quality: 1, speedRating: 1)
                        modelContext.insert(restuarant)
                        path.append(restuarant)
                    }
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let containter = try! ModelContainer(for: Restuarant.self, configurations: config)
    let example = Restuarant(name: "Work this way", price: 100, quality: 5, speedRating: 5)
    return ContentView()
        .modelContainer(containter)
}
