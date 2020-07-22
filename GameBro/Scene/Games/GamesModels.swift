//
//  GamesModels.swift
//  GameBro
//
//  Created by Ariel Theodore W on 20/07/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

enum Games {
    
    enum List {
        
        static let API = "/api/games?page="
        
        struct Request {
            
        }
        
        class Response: Pagination {
            var games: [Game]?
            
            private enum CodingKeys: String, CodingKey {
                case games = "results"
            }
            
            required init(from decoder: Decoder) throws {
                try super.init(from: decoder)
                let values = try decoder.container(keyedBy: CodingKeys.self)
                games = try values.decodeIfPresent([Game].self, forKey: .games)
            }
        }
        
        struct ViewModel {
            var game: [Game]
            var nextPage: String?
        }
        
    }
    
    enum Detail {
        
        static let API = "/api/games/"
        
        struct Request {
            
        }
        
        class Response: Game {
            // single model
        }
        
        struct ViewModel {
            var game: Game
        }
        
    }
    
}
