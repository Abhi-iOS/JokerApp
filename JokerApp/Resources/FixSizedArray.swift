//
//  FixSizedArray.swift
//  JokerApp
//
//  Created by Abhishek Singh on 02/10/23.
//

import Foundation

final class FixSizedArray<T> {
    private(set) var elements: [T] = []
    private let maxSize: Int
    
    init(maxSize: Int) {
        self.maxSize = maxSize
    }
    
    func add(_ element: T) {
        elements.append(element)
        // Drop the last element if size exceeds
        if elements.count > maxSize {
            elements.removeFirst()
        }
    }
    
    func toArray() -> [T] {
        return elements.reversed() // reversing the list so the latest element displays at first position
    }
}
