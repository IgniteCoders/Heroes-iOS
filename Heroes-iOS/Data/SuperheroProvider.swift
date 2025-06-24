//
//  SuperheroProvider.swift
//  Heroes-iOS
//
//  Created by Mañanas on 24/6/25.
//

import Foundation

class SuperheroProvider {
    
    static let BASE_URL     = "https://superheroapi.com/api/"
    static let ACCESS_TOKEN = "7252591128153666"
    
    static func findSuperheroesByName(query: String) async -> [Superhero] {
        guard let url = URL(string: "\(BASE_URL)/\(ACCESS_TOKEN)/search/\(query)") else {
            return []
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            return try JSONDecoder().decode(SuperheroResponse.self, from: data).results
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
}
