//
//  Meals.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab8 on 26/05/2023.
//

import Foundation

class MyResponse: Codable {
    var count: Int?
    var results: [Result]?
}

class Result: Codable {
    let credits: [Brand]?
    let isOneTop: Bool?
    let canonicalID: String?
    let numServings: Int?
    let thumbnailURL: String?
    let language: String?
    let id: Int?
    let buzzID: JSONNull?
    let show: Show?
    let yields: String?
    let nutritionVisibility: String?
    let instructions: [Instruction]?
    let createdAt: Int?
    let thumbnailAltText: String?
    let topics: [Topic]?
    let originalVideoURL: String?
    let cookTimeMinutes: Int?
    let keywords: String?
    let sections: [Section]?
    let slug: String?
    let aspectRatio: String?
    let videoID: Int?
    let userRatings: UserRatings?
    let brand: Brand?
    let facebookPosts: [JSONAny]?
    let promotion: String?
    let compilations: [JSONAny]?
    let tipsAndRatingsEnabled: Bool?
    let draftStatus: String?
    let inspiredByURL: String?
    let totalTimeMinutes: Int?
    let updatedAt: Int?
    let seoPath: JSONNull?
    let tags: [Tag]?
    let seoTitle: String?
    let approvedAt: Int?
    let renditions: [Rendition]?
    let showID: Int?
    let prepTimeMinutes: Int?
    let name, description, servingsNounPlural: String?
    let price: Price?
    let servingsNounSingular: String?
    let totalTimeTier: TotalTimeTier?
    let videoAdContent: String?
    let videoURL: String?
    let beautyURL: String?
    let isShoppable: Bool?
    let country: String?
    let brandID: Int?

    enum CodingKeys: String, CodingKey {
        case credits
        case isOneTop = "is_one_top"
        case canonicalID = "canonical_id"
        case numServings = "num_servings"
        case thumbnailURL = "thumbnail_url"
        case language, id
        case buzzID = "buzz_id"
        case show, yields
        case nutritionVisibility = "nutrition_visibility"
        case instructions
        case createdAt = "created_at"
        case thumbnailAltText = "thumbnail_alt_text"
        case topics
        case originalVideoURL = "original_video_url"
        case cookTimeMinutes = "cook_time_minutes"
        case keywords, sections, slug
        case aspectRatio = "aspect_ratio"
        case videoID = "video_id"
        case userRatings = "user_ratings"
        case brand
        case facebookPosts = "facebook_posts"
        case promotion, compilations
        case tipsAndRatingsEnabled = "tips_and_ratings_enabled"
        case draftStatus = "draft_status"
        case inspiredByURL = "inspired_by_url"
        case totalTimeMinutes = "total_time_minutes"
        case updatedAt = "updated_at"
        case seoPath = "seo_path"
        case tags
        case seoTitle = "seo_title"
        case approvedAt = "approved_at"
        case renditions
        case showID = "show_id"
        case prepTimeMinutes = "prep_time_minutes"
       // case nutrition,
             case name, description
        case servingsNounPlural = "servings_noun_plural"
        case price
        case servingsNounSingular = "servings_noun_singular"
        case totalTimeTier = "total_time_tier"
        case videoAdContent = "video_ad_content"
        case videoURL = "video_url"
        case beautyURL = "beauty_url"
        case isShoppable = "is_shoppable"
        case country
        case brandID = "brand_id"
    }

 
}



// MARK: - Brand
class Brand: Codable {
    let name: String?
    let id: Int?
    let slug: String?
    let imageURL: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case name, id, slug
        case imageURL = "image_url"
        case type
    }

}



// MARK: - Instruction
class Instruction: Codable {
    let appliance: String?
    let endTime: Int?
    let temperature: Int?
    let id, position: Int?
    let displayText: String?
    let startTime: Int?

    enum CodingKeys: String, CodingKey {
        case appliance
        case endTime = "end_time"
        case temperature, id, position
        case displayText = "display_text"
        case startTime = "start_time"
    }

    
}

// MARK: - Nutrition
class Nutrition: Codable {
    let fiber: Int?
    let updatedAt: Date?
    let protein, fat, calories, sugar: Int?
    let carbohydrates: Int?

    enum CodingKeys: String, CodingKey {
        case fiber
        case updatedAt = "updated_at"
        case protein, fat, calories, sugar, carbohydrates
    }

    
}



// MARK: - Price
class Price: Codable {
    let total: Int?
    let updatedAt: String?
    let portion, consumptionTotal, consumptionPortion: Int?

    enum CodingKeys: String, CodingKey {
        case total
        case updatedAt = "updated_at"
        case portion
        case consumptionTotal = "consumption_total"
        case consumptionPortion = "consumption_portion"
    }

   
}


// MARK: - Rendition
class Rendition: Codable {
    let bitRate: Int?
    let aspect: String?
    let minimumBitRate: Int?
    let name: String?
    let height: Int
    let maximumBitRate: Int?
    let container: String?
    let posterURL: String?
    let fileSize: Int?
    let url: String?
    let duration: Int?
    let contentType: String?
    let width: Int?

    enum CodingKeys: String, CodingKey {
        case bitRate = "bit_rate"
        case aspect
        case minimumBitRate = "minimum_bit_rate"
        case name, height
        case maximumBitRate = "maximum_bit_rate"
        case container
        case posterURL = "poster_url"
        case fileSize = "file_size"
        case url, duration
        case contentType = "content_type"
        case width
    }

}



// MARK: - Section
class Section: Codable {
    let components: [Component]?
    let name: String?
    let position: Int?

    
}

// MARK: - Component
class Component: Codable {
    let rawText, extraComment: String?
    let ingredient: Ingredient?
    let id, position: Int?
    let measurements: [Measurement]?

    enum CodingKeys: String, CodingKey {
        case rawText = "raw_text"
        case extraComment = "extra_comment"
        case ingredient, id, position, measurements
    }

}

// MARK: - Ingredient
class Ingredient: Codable {
    let updatedAt: Int?
    let name: String?
    let createdAt: Int?
    let displayPlural: String?
    let id: Int?
    let displaySingular: String?

    enum CodingKeys: String, CodingKey {
        case updatedAt = "updated_at"
        case name
        case createdAt = "created_at"
        case displayPlural = "display_plural"
        case id
        case displaySingular = "display_singular"
    }

    
}

// MARK: - Measurement
class Measurement: Codable {
    let unit: Unit?
    let quantity: String?
    let id: Int?

    
}

// MARK: - Unit
class Unit: Codable {
    let displaySingular, abbreviation: String?
    let system: String?
    let name, displayPlural: String?

    enum CodingKeys: String, CodingKey {
        case displaySingular = "display_singular"
        case abbreviation, system, name
        case displayPlural = "display_plural"
    }

   
}



// MARK: - Show
class Show: Codable {
    let name: String?
    let id: Int?

}



// MARK: - Tag
class Tag: Codable {
    let rootTagType: String?
    let name: String?
    let id: Int?
    let displayName, type: String?

    enum CodingKeys: String, CodingKey {
        case rootTagType = "root_tag_type"
        case name, id
        case displayName = "display_name"
        case type
    }
}



// MARK: - Topic
class Topic: Codable {
    let name, slug: String?

   
}

// MARK: - TotalTimeTier
class TotalTimeTier: Codable {
    let tier: String?
    let displayTier: String?

    enum CodingKeys: String, CodingKey {
        case tier
        case displayTier = "display_tier"
    }

}



// MARK: - UserRatings
class UserRatings: Codable {
    let score: Double?
    let countNegative, countPositive: Int?

    enum CodingKeys: String, CodingKey {
        case score
        case countNegative = "count_negative"
        case countPositive = "count_positive"
    }


}


// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

