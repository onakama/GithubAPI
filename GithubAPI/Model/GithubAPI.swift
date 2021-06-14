//
//  GithubAPI.swift
//  GithubAPI
//
//  Created by nekuro on 2021/06/13.
//

import Foundation

class GithubAPI{
    func searchRepo(page: Int, perPage: Int, completion: @escaping (Result<[Repository], Error>) -> Void) {
        let url = URL(string: "https://api.github.com/search/repositories?q=swift&sort=stars&page=\(page)&per_page=\(perPage)")!
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                completion(Result.failure(error))
                return
            }
            do{
                let repositoryes = try JSONDecoder().decode(RepositoryList.self, from: data!).items
                completion(Result.success(repositoryes))
            }catch let error {
                completion(Result.failure(error))
            }
        }
        task.resume()
    }
}
