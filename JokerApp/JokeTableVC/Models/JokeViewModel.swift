//
//  JokeViewModel.swift
//  JokerApp
//
//  Created by Abhishek Singh on 02/10/23.
//

import Foundation

protocol JokeRefresherDelegate: AnyObject {
    func refreshDataSource()
}

final class JokeViewModel {
    
    private let networkHelper = JokeNetworkHelper()
    private(set) var jokesDataSource = JokeDataModel()
    private weak var delegate: JokeRefresherDelegate?
    private var jokeThreshold: Int = 10
        
    init() {
        setupNetworkHelper()
    }
    
    func getJoke(with refresher: JokeRefresherDelegate) {
        delegate = refresher
        getSavedJokes()
        networkHelper.fetchData()
    }
    
    private func setupNetworkHelper() {
        networkHelper.completionHandler = { [weak self] data, response, error in
            guard let self else { return }
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let data = data {
                self.insertLatestJoke((String(data: data, encoding: .utf8) ?? ""))
            }
        }
        networkHelper.startPolling()
    }
    
    private func getSavedJokes() {
        let jokes = AppUserDefaults.value(forKey: .jokes)
        jokesDataSource.jokes = jokes
        delegate?.refreshDataSource()
    }
    
    private func insertLatestJoke(_ joke: String) {
        jokesDataSource.jokes.insert(joke, at: 0)
        AppUserDefaults.save(value: jokesDataSource.jokes, forKey: .jokes)
        if jokesDataSource.jokes.endIndex > jokeThreshold {
            jokesDataSource.jokes.removeLast()
        }
        delegate?.refreshDataSource()
    }
}
