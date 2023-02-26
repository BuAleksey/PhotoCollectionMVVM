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
    var isFavorite: Box<Bool> { get }
    init(photo: Photo)
    func fetchImageData(completion: @escaping() -> Void)
    func favoriteButtonPressed()
}

class PhotoDetailsViewModel: PhotoDetailsViewModelProtocol {
    var nameAutor: String {
        " Autor: \(photo.user.username) "
    }
    var image: Data?
    var isFavorite: Box<Bool>
    
    private let photo: Photo
    
    required init(photo: Photo) {
        self.photo = photo
        isFavorite = Box(value: UserDefaults.standard.bool(forKey: photo.id))
    }
    
    func fetchImageData(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchImageData(from: photo.urls.small) {
            [weak self] imageData in self?.image = imageData
            completion()
        }
    }
    
    func favoriteButtonPressed() {
        isFavorite.value.toggle()
        UserDefaults.standard.set(isFavorite.value, forKey: photo.id)
    }
}
