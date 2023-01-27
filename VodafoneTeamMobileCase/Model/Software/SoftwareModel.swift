
import Foundation

struct SoftwareModel : Identifiable ,Codable {
    var id = UUID()
	let artistViewUrl : String?
	let artworkUrl60 : String?
	let artworkUrl100 : String?
	let isGameCenterEnabled : Bool?
	let features : [String]?
	let supportedDevices : [String]?
	let advisories : [String]?
	let kind : String?
	let appletvScreenshotUrls : [String]?
	let screenshotUrls : [String]?
	let ipadScreenshotUrls : [String]?
	let artworkUrl512 : String?
	let trackCensoredName : String?
	let trackViewUrl : String?
	let contentAdvisoryRating : String?
	let averageUserRating : Double?
	let currentVersionReleaseDate : String?
	let releaseNotes : String?
	let artistId : Int?
	let artistName : String?
	let genres : [String]?
	let price : Double?
	let description : String?
	let currency : String?
	let bundleId : String?
	let trackId : Int?
	let trackName : String?
	let isVppDeviceBasedLicensingEnabled : Bool?
	let primaryGenreName : String?
	let primaryGenreId : Int?
	let sellerName : String?
	let releaseDate : String?
	let genreIds : [String]?
	let version : String?
	let wrapperType : String?
	let minimumOsVersion : String?
	let languageCodesISO2A : [String]?
	let fileSizeBytes : String?
	let sellerUrl : String?
	let formattedPrice : String?
	let averageUserRatingForCurrentVersion : Double?
	let userRatingCountForCurrentVersion : Int?
	let trackContentRating : String?
	let userRatingCount : Int?

	enum CodingKeys: String, CodingKey {

		case artistViewUrl = "artistViewUrl"
		case artworkUrl60 = "artworkUrl60"
		case artworkUrl100 = "artworkUrl100"
		case isGameCenterEnabled = "isGameCenterEnabled"
		case features = "features"
		case supportedDevices = "supportedDevices"
		case advisories = "advisories"
		case kind = "kind"
		case appletvScreenshotUrls = "appletvScreenshotUrls"
		case screenshotUrls = "screenshotUrls"
		case ipadScreenshotUrls = "ipadScreenshotUrls"
		case artworkUrl512 = "artworkUrl512"
		case trackCensoredName = "trackCensoredName"
		case trackViewUrl = "trackViewUrl"
		case contentAdvisoryRating = "contentAdvisoryRating"
		case averageUserRating = "averageUserRating"
		case currentVersionReleaseDate = "currentVersionReleaseDate"
		case releaseNotes = "releaseNotes"
		case artistId = "artistId"
		case artistName = "artistName"
		case genres = "genres"
		case price = "price"
		case description = "description"
		case currency = "currency"
		case bundleId = "bundleId"
		case trackId = "trackId"
		case trackName = "trackName"
		case isVppDeviceBasedLicensingEnabled = "isVppDeviceBasedLicensingEnabled"
		case primaryGenreName = "primaryGenreName"
		case primaryGenreId = "primaryGenreId"
		case sellerName = "sellerName"
		case releaseDate = "releaseDate"
		case genreIds = "genreIds"
		case version = "version"
		case wrapperType = "wrapperType"
		case minimumOsVersion = "minimumOsVersion"
		case languageCodesISO2A = "languageCodesISO2A"
		case fileSizeBytes = "fileSizeBytes"
		case sellerUrl = "sellerUrl"
		case formattedPrice = "formattedPrice"
		case averageUserRatingForCurrentVersion = "averageUserRatingForCurrentVersion"
		case userRatingCountForCurrentVersion = "userRatingCountForCurrentVersion"
		case trackContentRating = "trackContentRating"
		case userRatingCount = "userRatingCount"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl)
		artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
		artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
		isGameCenterEnabled = try values.decodeIfPresent(Bool.self, forKey: .isGameCenterEnabled)
		features = try values.decodeIfPresent([String].self, forKey: .features)
		supportedDevices = try values.decodeIfPresent([String].self, forKey: .supportedDevices)
		advisories = try values.decodeIfPresent([String].self, forKey: .advisories)
		kind = try values.decodeIfPresent(String.self, forKey: .kind)
		appletvScreenshotUrls = try values.decodeIfPresent([String].self, forKey: .appletvScreenshotUrls)
		screenshotUrls = try values.decodeIfPresent([String].self, forKey: .screenshotUrls)
		ipadScreenshotUrls = try values.decodeIfPresent([String].self, forKey: .ipadScreenshotUrls)
		artworkUrl512 = try values.decodeIfPresent(String.self, forKey: .artworkUrl512)
		trackCensoredName = try values.decodeIfPresent(String.self, forKey: .trackCensoredName)
		trackViewUrl = try values.decodeIfPresent(String.self, forKey: .trackViewUrl)
		contentAdvisoryRating = try values.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
		averageUserRating = try values.decodeIfPresent(Double.self, forKey: .averageUserRating)
		currentVersionReleaseDate = try values.decodeIfPresent(String.self, forKey: .currentVersionReleaseDate)
		releaseNotes = try values.decodeIfPresent(String.self, forKey: .releaseNotes)
		artistId = try values.decodeIfPresent(Int.self, forKey: .artistId)
		artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
		genres = try values.decodeIfPresent([String].self, forKey: .genres)
		price = try values.decodeIfPresent(Double.self, forKey: .price)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		bundleId = try values.decodeIfPresent(String.self, forKey: .bundleId)
		trackId = try values.decodeIfPresent(Int.self, forKey: .trackId)
		trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
		isVppDeviceBasedLicensingEnabled = try values.decodeIfPresent(Bool.self, forKey: .isVppDeviceBasedLicensingEnabled)
		primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
		primaryGenreId = try values.decodeIfPresent(Int.self, forKey: .primaryGenreId)
		sellerName = try values.decodeIfPresent(String.self, forKey: .sellerName)
		releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
		genreIds = try values.decodeIfPresent([String].self, forKey: .genreIds)
		version = try values.decodeIfPresent(String.self, forKey: .version)
		wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
		minimumOsVersion = try values.decodeIfPresent(String.self, forKey: .minimumOsVersion)
		languageCodesISO2A = try values.decodeIfPresent([String].self, forKey: .languageCodesISO2A)
		fileSizeBytes = try values.decodeIfPresent(String.self, forKey: .fileSizeBytes)
		sellerUrl = try values.decodeIfPresent(String.self, forKey: .sellerUrl)
		formattedPrice = try values.decodeIfPresent(String.self, forKey: .formattedPrice)
		averageUserRatingForCurrentVersion = try values.decodeIfPresent(Double.self, forKey: .averageUserRatingForCurrentVersion)
		userRatingCountForCurrentVersion = try values.decodeIfPresent(Int.self, forKey: .userRatingCountForCurrentVersion)
		trackContentRating = try values.decodeIfPresent(String.self, forKey: .trackContentRating)
		userRatingCount = try values.decodeIfPresent(Int.self, forKey: .userRatingCount)
	}

}
