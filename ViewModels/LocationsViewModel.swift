//
//  LocationsViewModel.swift
//  SwiftuiMapApp
//
//  Created by Eugenia Uvarov on 5/14/25.
//

import Foundation
import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }

    private func updateMapRegion(location: Location) {
        mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
    }
    
   func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        //LOGIC EXPLANATION
        // “Find the first item in the list that matches ‘nextlocation’ and give me its index (position).”
        //firstIndex == firstMatch
        //        OR ...“Let’s go through groceryList.
        //        For each item ($0), check if it’s equal to "Milk".
        //        When you find the first match, give me its index, and save it in currentIndex.”
        
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
            return
        }
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
            
        }
        let nextLocation  = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
