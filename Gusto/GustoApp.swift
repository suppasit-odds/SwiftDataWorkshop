//
//  GustoApp.swift
//  Gusto
//
//  Created by Suppasit chuwatsawat on 18/1/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct GustoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Restuarant.self)
    }
}
