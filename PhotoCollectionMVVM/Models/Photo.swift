//
//  Photo.swift
//  PhotoCollectionMVVM
//
//  Created by Buba on 13.01.2023.
//

struct Photo: Decodable {
    let urls: Urls
    let user: User
}

struct Urls: Decodable {
    let thumb: String
    let small: String
}

struct User: Decodable {
    let username: String
}
