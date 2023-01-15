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
            guard let image = viewModel.imageData else { return }
            photoImage.image = UIImage(data: image)
        }
    }
}
