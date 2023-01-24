//
//  CharacterListViewModel.swift
//  PhotoCollectionMVVM
//
//  Created by Buba on 13.01.2023.
//

import Foundation

protocol PhotosViewModelProtocol {
    func fetchData(completion: @escaping() -> Void)
    func getNumbersOfItems() -> Int
    func getPhoto(at indexPath: IndexPath) -> PhotoCellViewModelProtocol
    func getPhotoDetails(at indexPaht: IndexPath) -> PhotoDetailsViewModelProtocol
}

class PhotosViewModel: PhotosViewModelProtocol {
    private var photos: [Photo] = []
    
    func fetchData(completion: @escaping() -> Void) {
        NetworkManager.shared.fetchData { [weak self] result in
            switch result {
            case .success(let photos):
                self?.photos = photos
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getNumbersOfItems() -> Int {
        photos.count
    }
    
    func getPhoto(at indexPath: IndexPath) -> PhotoCellViewModelProtocol {
        PhotoCellViewModel(photo: photos[indexPath.item])
    }
    
    func getPhotoDetails(at indexPaht: IndexPath) -> PhotoDetailsViewModelProtocol {
        PhotoDetailsViewModel(photo: photos[indexPaht.item])
    }
}
