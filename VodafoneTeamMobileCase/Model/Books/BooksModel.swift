import Foundation

struct BooksModel : Identifiable,Codable {
    var id = UUID()
	let artistId : Int?
	let artistName : String?
	let genres : [String]?
	let price : Double?
	let description : String?
	let trackId : Int?
	let trackName : String?
	let genreIds : [String]?
	let releaseDate : String?
	let artistIds : [Int]?
	let currency : String?
	let artworkUrl60 : String?
	let artworkUrl100 : String?
	let artistViewUrl : String?
	let trackCensoredName : String?
	let fileSizeBytes : Int?
	let formattedPrice : String?
	let trackViewUrl : String?
	let kind : String?

	enum CodingKeys: String, CodingKey {

		case artistId = "artistId"
		case artistName = "artistName"
		case genres = "genres"
		case price = "price"
		case description = "description"
		case trackId = "trackId"
		case trackName = "trackName"
		case genreIds = "genreIds"
		case releaseDate = "releaseDate"
		case artistIds = "artistIds"
		case currency = "currency"
		case artworkUrl60 = "artworkUrl60"
		case artworkUrl100 = "artworkUrl100"
		case artistViewUrl = "artistViewUrl"
		case trackCensoredName = "trackCensoredName"
		case fileSizeBytes = "fileSizeBytes"
		case formattedPrice = "formattedPrice"
		case trackViewUrl = "trackViewUrl"
		case kind = "kind"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		artistId = try values.decodeIfPresent(Int.self, forKey: .artistId)
		artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
		genres = try values.decodeIfPresent([String].self, forKey: .genres)
		price = try values.decodeIfPresent(Double.self, forKey: .price)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		trackId = try values.decodeIfPresent(Int.self, forKey: .trackId)
		trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
		genreIds = try values.decodeIfPresent([String].self, forKey: .genreIds)
		releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
		artistIds = try values.decodeIfPresent([Int].self, forKey: .artistIds)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
		artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
		artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl)
		trackCensoredName = try values.decodeIfPresent(String.self, forKey: .trackCensoredName)
		fileSizeBytes = try values.decodeIfPresent(Int.self, forKey: .fileSizeBytes)
		formattedPrice = try values.decodeIfPresent(String.self, forKey: .formattedPrice)
		trackViewUrl = try values.decodeIfPresent(String.self, forKey: .trackViewUrl)
		kind = try values.decodeIfPresent(String.self, forKey: .kind)
	}

}
