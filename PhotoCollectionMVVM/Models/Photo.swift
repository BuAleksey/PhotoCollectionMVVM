//
//  Photo.swift
//  PhotoCollectionMVVM
//
//  Created by Buba on 13.01.2023.
//

struct Photo: Decodable {
    let urls: Urls
}

struct Urls: Decodable {
    let thumb: String
}
