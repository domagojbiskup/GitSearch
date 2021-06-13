//
//  GitRepo.swift
//  GitSearch
//
//  Created by Domagoj Biškup on 10/06/2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gitRepo = try? newJSONDecoder().decode(GitRepo.self, from: jsonData)

import Foundation

// MARK: - GitRepo
struct GitRepo: Codable {
//    let totalCount: Int
//    let incompleteResults: Bool
    let items: [Item]

    enum CodingKeys: String, CodingKey {
//        case totalCount = "total_count"
//        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    let id: Int
    let name: String
    let owner: Owner
    let itemDescription: String?
    let updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case itemDescription = "description"
        case updatedAt = "updated_at"
    }
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
//    let id: Int

    enum CodingKeys: String, CodingKey {
        case login//, id
    }
}


