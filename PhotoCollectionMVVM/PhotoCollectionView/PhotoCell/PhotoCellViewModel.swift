//
//  PhotoCellViewModel.swift
//  PhotoCollectionMVVM
//
//  Created by Buba on 14.01.2023.
//

import Foundation

protocol PhotoCellViewModelProtocol {
    var imageData: Data? { get }
    init(photo: Photo)
    func fetchImageData(completion: @escaping() -> Void)
}

class PhotoCellViewModel: PhotoCellViewModelProtocol {
    var imageData: Data?
    private let photo: Photo
    
    required init(photo: Photo) {
        self.photo = photo
    }
    
    func fetchImageData(completion: @escaping() -> Void) {
        NetworkManager.shared.fetchImageData(from: photo.urls.thumb) { [weak self] data in
            self?.imageData = data
            completion()
        }
    }
}
