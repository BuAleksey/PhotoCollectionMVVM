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
}

class PhotoCellViewModel: PhotoCellViewModelProtocol {
    var imageData: Data? {
        NetworkManager.shared.fetchImageData(from: photo.urls.small)
    }
    private let photo: Photo
    
    required init(photo: Photo) {
        self.photo = photo
    }
}
