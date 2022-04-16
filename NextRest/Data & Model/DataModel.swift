//
//  DataModel.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 09.04.2022.
//

import Foundation

struct Restaurant: Codable {
    let name: String
    let registeredAtTripadvisor: Bool
    let rating, ratingFood, ratingPriceQuality, ratingService: Double?
    let city: City
    let address: String
    let zipcode: String?
    let country: Country
    let latitude, longitude: Double?
    let neighborhood, email, tel: String?
    let tripadvisorURL: String
    let menuURL: String?
    let workingHoursByDays: [[String]?]?
    let priceLevelFrom, priceLevelTo: Int?
    let dietaryRestrictions: [String]
    let glutenFreeDishes, vegetarianFriendly, veganFriendly: Bool
    let cuisines: [String]
    let priceRangeMin, priceRangeMax: Int?
    let priceRangeCurrency: PriceRangeCurrency?
    let reviewsCount: Int
    let restaurantDescription: String
    let eatingTimes: [EatingTime]
    let features: [String]
    let landmark: [Landmark]?
    let website: String?
    let rank, rankTotalCount: Int?
    let photoUrls: [String]?
    let id: Int

    enum CodingKeys: String, CodingKey {
        case name
        case registeredAtTripadvisor = "registered_at_tripadvisor"
        case rating
        case ratingFood = "rating_food"
        case ratingPriceQuality = "rating_price_quality"
        case ratingService = "rating_service"
        case city, address, zipcode, country, latitude, longitude, neighborhood, email, tel
        case tripadvisorURL = "tripadvisor_url"
        case menuURL = "menu_url"
        case workingHoursByDays = "working_hours_by_days"
        case priceLevelFrom = "price_level_from"
        case priceLevelTo = "price_level_to"
        case dietaryRestrictions = "dietary_restrictions"
        case glutenFreeDishes = "gluten_free_dishes"
        case vegetarianFriendly = "vegetarian_friendly"
        case veganFriendly = "vegan_friendly"
        case cuisines
        case priceRangeMin = "price_range_min"
        case priceRangeMax = "price_range_max"
        case priceRangeCurrency = "price_range_currency"
        case reviewsCount = "reviews_count"
        case restaurantDescription = "description"
        case eatingTimes = "eating_times"
        case features, landmark, website, rank
        case rankTotalCount = "rank_total_count"
        case photoUrls = "photo_urls"
        case id
    }
}

enum City: String, Codable {
    case москва = "Москва"
}

enum Country: String, Codable {
    case россия = "Россия"
}

enum EatingTime: String, Codable {
    case бранч = "Бранч"
    case завтрак = "Завтрак"
    case напитки = "Напитки"
    case обед = "Обед"
    case открытоДопоздна = "Открыто допоздна"
    case ужин = "Ужин"
}

enum Landmark: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Landmark.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Landmark"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum PriceRangeCurrency: String, Codable {
    case rub = "RUB"
}


//// MARK: - Encode/decode helpers


// Инициализаторы пригодятся для внедрения DI


//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
