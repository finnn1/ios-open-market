import Foundation

struct ProductsDataManager {
    func getData(pageNumber: Int, itemsPerPage: Int, completion: @escaping (Result<Products, Error>) -> Void) {
        
        guard let url = URL(string: "https://market-training.yagom-academy.kr/api/products?page_no=\(pageNumber)&items_per_page=\(itemsPerPage)") else { return }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 300..<400:
                    completion(.failure(URLSessionError.redirection))
                    return
                case 400..<500:
                    completion(.failure(URLSessionError.clientError))
                    return
                case 500..<600:
                    completion(.failure(URLSessionError.serverError))
                    return
                default:
                    break
                }
            }
            
            guard let data = data else {
                let decodingContext = DecodingError.Context.init(codingPath: Products.CodingKeys.allCases, debugDescription: "")
                completion(.failure(DecodingError.dataCorrupted(decodingContext)))
                return
            }
            
            guard let decodedData = try? JSONDecoder().decode(Products.self, from: data) else {
                let decodingContext = DecodingError.Context.init(codingPath: Products.CodingKeys.allCases, debugDescription: "")
                completion(.failure(DecodingError.typeMismatch(Products.self, decodingContext)))
                return
            }
            
            completion(.success(decodedData))
        }
        task.resume()
    }
}
