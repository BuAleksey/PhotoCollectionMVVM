//
//  PhotoDetailsViewModel.swift
//  PhotoCollectionMVVM
//
//  Created by Buba on 24.02.2023.
//

import Foundation

protocol PhotoDetailsViewModelProtocol {
    var nameAutor: String { get }
    var image: Data? { get }
    init(photo: Photo)
    func fetchImageData(completion: @escaping() -> Void)
}

class PhotoDetailsViewModel: PhotoDetailsViewModelProtocol {
    var nameAutor: String {
        " Autor: \(photo.user.username) "
    }
    var image: Data?
    
    private let photo: Photo
    
    required init(photo: Photo) {
        self.photo = photo
    }
    
    func fetchImageData(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchImageData(from: photo.urls.small) {
            [weak self] imageData in self?.image = imageData
            completion()
        }
    }
}
