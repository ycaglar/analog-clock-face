//
//  Data.swift
//  Clock
//
//  Created by Caglar on 7/10/20.
//  Copyright © 2020 Caglar. All rights reserved.
//

import Foundation

let dimensionsData: Array<Part> = load("dimensionsData.json")
let timeMarkers: Array<Part> = dimensionsData.filter{$0.category == .timeMarkers}
let movingHands: Array<Part> = dimensionsData.filter{$0.category == .movingHands}
let shaft: Array<Part> = dimensionsData.filter{$0.category == .shaft}

/// A helper function reading data from a json database "Parameter.json" and parsing it to an array
/// - Parameter filename: is the exact name of the target  json database
/// - Returns: an array of Part model object
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

