//
//  GitService.swift
//  GitSearch
//
//  Created by Domagoj Biškup on 10/06/2021.
//

import Alamofire
import Foundation

private let url = "https://api.github.com/search/repositories?q="

var gitRepo: GitRepo?

var userInput: String?
var arrayIndex: Int?

extension GitResultsTVC {
    func fetchData() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        AF.request(url + "\(userInput!)" + "&sort=updated", method: .get).responseDecodable(of: GitRepo.self, decoder: decoder) {
            response in
            gitRepo = response.value
            self.tableView.reloadData()
        }
    }
}

struct Format {
    func date(_ updatedAt: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = .current
        return formatter.string(from: updatedAt)
    }
}

