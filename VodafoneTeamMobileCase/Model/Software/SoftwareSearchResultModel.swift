
import Foundation

struct SoftwareSearchResultModel : Codable {

	let resultCount : Int?
	let results : [SoftwareModel]?

	enum CodingKeys: String, CodingKey {

		case resultCount = "resultCount"
		case results = "results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount)
		results = try values.decodeIfPresent([SoftwareModel].self, forKey: .results)
	}

}
