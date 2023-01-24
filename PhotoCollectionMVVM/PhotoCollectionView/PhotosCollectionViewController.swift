//
//  CharacterListCollectionViewController.swift
//  PhotoCollectionMVVM
//
//  Created by Buba on 13.01.2023.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    private var viewModel: PhotosViewModelProtocol! {
        didSet {
            viewModel.fetchData {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PhotosViewModel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? PhotoDetailsViewController else { return }
        detailVC.viewModel = sender as? PhotoDetailsViewModelProtocol
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumbersOfItems()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        guard let photoCell = cell as? PhotoCell else { return UICollectionViewCell() }
        photoCell.viewModel = viewModel.getPhoto(at: indexPath)
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoDetailsViewModel = viewModel.getPhotoDetails(at: indexPath)
        performSegue(withIdentifier: "showDetails", sender: photoDetailsViewModel)
    }
}
