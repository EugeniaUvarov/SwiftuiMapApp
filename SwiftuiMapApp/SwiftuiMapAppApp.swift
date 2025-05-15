//
//  SwiftuiMapAppApp.swift
//  SwiftuiMapApp
//
//  Created by Eugenia Uvarov on 5/13/25.
//

import SwiftUI

@main
struct SwiftuiMapAppApp: App {
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
