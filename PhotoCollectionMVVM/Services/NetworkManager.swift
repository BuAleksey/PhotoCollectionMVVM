//
//  NetworkManager.swift
//  PhotoCollectionMVVM
//
//  Created by Buba on 13.01.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let accessKey = "hM3GzPmxC6uFaHuw5qoBLZwf7Z3up330JbF9pJUovZ4"
    let secretKey = "XivRlMLSWwW501UhE0vRmsazZe1OQyX6l8fxheKfWrQ"
    let url = "https://api.unsplash.com/photos/?client_id=hM3GzPmxC6uFaHuw5qoBLZwf7Z3up330JbF9pJUovZ4"
    
    private init() {}
    
    func fetchData(comletion: @escaping(Result<[Photo], Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                let photos = try JSONDecoder().decode([Photo].self, from: data)
                DispatchQueue.main.async {
                    comletion(.success(photos))
                }
            } catch {
                comletion(.failure(error))
            }
        }.resume()
    }
    
    func fetchImageData(from url: String) -> Data? {
        guard let url = URL(string: url) else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}
