//
//  Games.swift
//  GameBro
//
//  Created by Ariel Theodore W on 20/07/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

class Game: Decodable {
    var id: Int?
    var name: String?
    var description: String?
    var dateRelease: String?
    var imageBackground: String?
    var rating: Double?
    var website: String?
    var platform: [ParentPlatform]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description = "description_raw"
        case dateRelease = "released"
        case imageBackground = "background_image"
        case rating
        case website
        case platform = "parent_platforms"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        dateRelease = try values.decodeIfPresent(String.self, forKey: .dateRelease)
        imageBackground = try values.decodeIfPresent(String.self, forKey: .imageBackground)
        rating = try values.decodeIfPresent(Double.self, forKey: .rating)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        platform = try values.decodeIfPresent([ParentPlatform].self, forKey: .platform)
    }
}
