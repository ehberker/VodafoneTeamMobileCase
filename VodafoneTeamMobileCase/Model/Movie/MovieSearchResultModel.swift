import Foundation

struct MoviesSearchResultModel : Codable {

	let resultCount : Int?
	let results : [MoviesModel]?

	enum CodingKeys: String, CodingKey {

		case resultCount = "resultCount"
		case results = "results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount)
		results = try values.decodeIfPresent([MoviesModel].self, forKey: .results)
	}

}
