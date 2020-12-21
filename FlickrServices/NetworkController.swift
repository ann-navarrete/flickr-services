import Foundation
import UIKit

// given a keyword, return an array of images based on keyword
//inject API key

class NetworkController {
    
    var baseUrl: String
    var session: URLSession
    var apiKey: String

    init(baseUrl: String, session: URLSession, apiKey: String) {
        self.baseUrl = baseUrl
        self.session = session
        self.apiKey = apiKey
    }
    
    func fetchSearchInfo(search: String, completion: @escaping (SearchResult) -> Void){
        let url = urlBuilder(search: search)
        let task = self.session.dataTask(with: url) {
            (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
               let searchResult = try?
                jsonDecoder.decode(SearchResult.self, from: data) {
                completion(searchResult)
                print(searchResult)
            }
        }
        task.resume()
    }
    
    func urlBuilder(search: String) -> URL {
        let url = URL(string: self.baseUrl)!.appendingPathComponent("services/rest")
        let query: [String: String] = [
            "api_key": self.apiKey,
            "method": "flickr.photos.search",
            "text": search,
            "format": "json",
            "nojsoncallback": "1",
            "extras": "url_s"
        ]
        return url.withQueries(query)!
    }
    
    // function to fetch information from api
//    func fetchImages(search: String, completion: @escaping (Array<UIImage>) -> Void) {
//
        
    //}
    
    // create a codeable struct for the information required
        // title
        // url
    
    func fetchImge(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = self.session.dataTask(with: url) {
            (data, response, error) in
            if let data = data,
               let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
}


struct SearchResult: Decodable {
    struct PhotoResult: Decodable {
        var photo: [PhotoInfo]
    }
    
    var photos: PhotoResult
}

struct PhotoInfo: Decodable {
    var title: String
    var url_s: URL
}

extension URL {
      func withQueries(_ queries: [String: String]) -> URL? {
          var components = URLComponents(url: self,
          resolvingAgainstBaseURL: true)
          components?.queryItems = queries.map
  { URLQueryItem(name: $0.0, value: $0.1) }
          return components?.url
      }
}

