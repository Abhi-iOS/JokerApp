//
//  JokeNetworkHelper.swift
//  JokerApp
//
//  Created by Abhishek Singh on 02/10/23.
//

import Foundation

final class JokeNetworkHelper {
    private let apiUrl = URL(string: "https://geek-jokes.sameerkumar.website/api")
    private let session = URLSession.shared
    private var pollingTimer: Timer?
    private let pollingInterval: TimeInterval = 60 // in seconds
    
    // Callback to handle the API response
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    
    // Function to fetch data from the API
    func fetchData() {
        guard let apiUrl else { return }
        let task = session.dataTask(with: apiUrl) { [weak self] (data, response, error) in
            guard let self else { return }
            self.completionHandler?(data, response, error)
        }
        task.resume()
    }
    
    // Start polling the API at regular intervals
    func startPolling() {
        // Stop any existing polling timer before starting a new one
        stopPolling()
        pollingTimer = Timer.scheduledTimer(withTimeInterval: pollingInterval, repeats: true) { [weak self] _ in
            guard let self else { return }
            // Fetch data from the API
            self.fetchData()
        }
    }
    
    // Stop polling the API
    func stopPolling() {
        pollingTimer?.invalidate()
        pollingTimer = nil
    }
}
