import Foundation

class Photos: Codable {
    
    var photoData: String
    var photoDescription: String
    var photoIsLiked: Bool = false
    
    init(photoData: String, photoDescription: String) {
        
        self.photoData = photoData
        self.photoDescription = photoDescription
    }
    
    public enum CodingKeys: String, CodingKey {
        case photoData, photoDescription, photoIsLiked
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.photoData = try container.decode(String.self, forKey: .photoData)
        self.photoDescription = try container.decode(String.self, forKey: .photoDescription)
        self.photoIsLiked = try container.decode(Bool.self, forKey: .photoIsLiked)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.photoData, forKey: .photoData)
        try container.encode(self.photoDescription, forKey: .photoDescription)
        try container.encode(self.photoIsLiked, forKey: .photoIsLiked)
    }
    
    func savePhotoObject() {
        var array = UserDefaults.standard.value([Photos].self, key: "\(ManagerVC.currentLogin)") ?? []
        array.append(self)
        UserDefaults.standard.set(encodable: array, key: "\(ManagerVC.currentLogin)")
    }
}
