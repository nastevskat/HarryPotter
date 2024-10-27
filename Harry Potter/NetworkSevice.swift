import Foundation

class NetworkService {
    static let shared = NetworkService()

    private init() {}

    func fetchBooks(completion: @escaping (Result<[Book], Error>) -> Void) {
        guard let url = URL(string: "https://potterapi-fedeperin.vercel.app/en/books") else {
                completion(.failure(URLError(.badURL)))
                return
            }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.apiDateFormat)
                let books = try decoder.decode([Book].self, from: data)
                completion(.success(books))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        guard let url = URL(string: "https://potterapi-fedeperin.vercel.app/en/characters") else {
            completion(.failure(URLError(.badURL)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.apiDateFormat)
                let characters = try decoder.decode([Character].self, from: data)
                completion(.success(characters))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

extension DateFormatter {
    static let apiDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
