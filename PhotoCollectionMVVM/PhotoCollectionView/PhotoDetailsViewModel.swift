//
//  PhotoDetaolViewModel.swift
//  PhotoCollectionMVVM
//
//  Created by Buba on 17.01.2023.
//

import Foundation

protocol PhotoDetailsViewModelProtocol {
    var name: String { get }
    var imageData: Data? { get }
    init(photo: Photo)
    func fetchImageData(completion: @escaping() -> Void)
}

class PhotoDetailsViewModel: PhotoDetailsViewModelProtocol {
    var name: String {
        photo.user.username
    }
    var imageData: Data?
    private var photo: Photo
    
    required init(photo: Photo) {
        self.photo = photo
    }
    
    func fetchImageData(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchImageData(from: photo.urls.small) { [weak self] data in
            self?.imageData = data
            completion()
        }
    }
}
