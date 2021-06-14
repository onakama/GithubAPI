//
//  ContentView.swift
//  GithubAPI
//
//  Created by nekuro on 2021/06/13.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var githubRepo: GithubRepo = GithubRepo()
    var body: some View {
        List(githubRepo.repositoryes) { repository in
            VStack(alignment: .leading){
                Text(repository.name)
                .font(.system(size: 24).bold())
                Text(repository.description ?? "")
                Text("Start: \(repository.stargazersCount)")
            }
        }
        .onAppear{
            githubRepo.serchRepo()
        }
        .alert(isPresented: $githubRepo.showingAlert) {
            Alert(
                title: Text("Error"),
                message: Text(githubRepo.errorMessage),
                dismissButton: .default(Text("Close"))
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
