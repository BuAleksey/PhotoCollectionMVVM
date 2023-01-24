//
//  PhotoDetailViewController.swift
//  PhotoCollectionMVVM
//
//  Created by Buba on 17.01.2023.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    @IBOutlet var image: UIImageView!
    @IBOutlet var authorNameLabel: UILabel!
    
    var viewModel: PhotoDetailsViewModelProtocol!
}
