//
//  PhotoCollectionViewCell.swift
//  PhotoCollectionMVVM
//
//  Created by Buba on 14.01.2023.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet var photoImage: UIImageView!
    
    var viewModel: PhotoCellViewModelProtocol! {
        didSet {
            viewModel.fetchImageData { [weak self] in
                guard let image = self?.viewModel.imageData else { return }
                self?.photoImage.image = UIImage(data: image)
            }
        }
    }
}
