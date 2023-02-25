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
    
    var viewModel: PhotoDetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchImageData { [unowned self] in
            self.image.image = UIImage(data: self.viewModel.image ?? Data())
        }
        nameAutor.text = viewModel.nameAutor
    }
}
