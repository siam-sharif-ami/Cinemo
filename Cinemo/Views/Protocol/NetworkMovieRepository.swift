import Foundation
import Combine

class NetworkMovieRepository: MovieRepositoryProtocol {

  func fetchSearchData(searchedString: String) -> AnyPublisher<MovieDatabase, Error> {
    let endPoint = "https://yts.mx/api/v2/list_movies.json?query_term=\(searchedString)"

    guard let url = URL(string: endPoint) else {
        print("bad url ")
      return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
    }

    return URLSession.shared.dataTaskPublisher(for: url)
      .tryMap { result in
        guard let response = result.response as? HTTPURLResponse, response.statusCode == 200 else {
            print("bad url response")
          throw URLError(.badServerResponse)
        }
          print(result.data)
          return result.data
      }
      .decode(type: MovieDatabase.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}
