//
//  PhotoDetailsViewController.swift
//  PhotoCollectionMVVM
//
//  Created by Buba on 24.02.2023.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    @IBOutlet private var image: UIImageView!
    @IBOutlet private var nameAutor: UILabel!
    @IBOutlet var favoriteButton: UIButton!
    
    var viewModel: PhotoDetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func favoriteButtonPressed() {
        viewModel.favoriteButtonPressed()
    }
    
    private func setupUI() {
        setStatusForFavoriteButton(viewModel.isFavorite.value)
        viewModel.isFavorite.bind { [unowned self] value in
            setStatusForFavoriteButton(value)
        }
        viewModel.fetchImageData { [unowned self] in
            self.image.image = UIImage(data: self.viewModel.image ?? Data())
        }
        nameAutor.text = viewModel.nameAutor
    }
    
    private func setStatusForFavoriteButton(_ status: Bool) {
        favoriteButton.tintColor = status ? .red : .darkGray
    }
}
