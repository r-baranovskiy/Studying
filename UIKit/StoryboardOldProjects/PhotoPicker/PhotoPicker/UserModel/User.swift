import Foundation


struct User: Codable {
    
    let login: String
    var password: String
    
    init(login: String, password: String) {
        
        self.login = login
        self.password = password
        
    }
    
    func saveUsers() {
        var array = DataManager.value([User].self, forKey: .login) ?? []
        array.append(self)
        DataManager.saveData(array, type: .login)
        print(array)
    }
    
}
