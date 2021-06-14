//
//  GithubRepo.swift
//  GithubAPI
//
//  Created by nekuro on 2021/06/13.
//

import Foundation

class GithubRepo: ObservableObject{
    @Published var repositoryes: [Repository] = []
    @Published var showingAlert = false
    @Published var errorMessage = ""
    

    func serchRepo(){
        let githubAPI = GithubAPI()
        githubAPI.searchRepo(page: 0, perPage: 30){result in
            switch result{
            case let .success(repositoryes):
                DispatchQueue.main.async {
                    self.repositoryes = repositoryes
                }
            case let .failure(error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.showingAlert = true
                }
            }
        }
    }
}
