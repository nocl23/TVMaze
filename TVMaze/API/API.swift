import Foundation

class API {
    static func showSeries(completion: @escaping ([Serie], Error?)->()) -> URLSessionDataTask {
        let url = URL(string: "https://api.tvmaze.com/shows")!
        
        return URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            
            if let data = data ,
                let serie = try? decoder.decode([Serie].self, from: data){
                completion(serie, nil)
            } else {
                completion([], error)
            }
            
        }
    }
    
    static func getEpisode(id: Int, completion: @escaping ([Episode]?, Error?)->()) -> URLSessionDataTask {
        let url = URL(string:"https://api.tvmaze.com/shows/\(id)/episodes")!
        return URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data {
                let episode = try? decoder.decode([Episode].self, from: data)
                completion(episode, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getCasting(id: Int, completion: @escaping ([Casting]?, Error?)->()) -> URLSessionDataTask {
        let url = URL(string:"https://api.tvmaze.com/shows/\(id)/cast")!
        return URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data {
                let casting = try? decoder.decode([Casting].self, from: data)
                completion(casting, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
