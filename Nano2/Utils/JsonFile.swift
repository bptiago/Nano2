
import Foundation

protocol JsonFile {
    associatedtype T: Decodable
    
    var fileName: String { get }
    
    func loadFile() -> Data?
    func decode() -> [T]
//    func encode(_ data: Data)
}

extension JsonFile {
    func loadFile() -> Data? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("File not found")
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        return data
    }
    
    func decode() -> [T] {
        let data = loadFile()
        
        guard let data else {
            print("Failed to load data from \(fileName)")
            return []
        }

        let decoder = JSONDecoder()
        
        do {
            let decodedJson = try decoder.decode([T].self, from: data)
            return decodedJson
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
