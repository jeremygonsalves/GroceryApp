import Foundation

// MARK: - Array Extensions

extension Array {
    
    /// Safely retrieves an element at the specified index if it exists.
    /// - Parameter index: The index of the element.
    /// - Returns: The element if the index is within bounds, otherwise nil.
    func safeElement(at index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    /// Splits the array into chunks of the specified size.
    /// - Parameter size: The size of each chunk.
    /// - Returns: An array of arrays, where each sub-array is a chunk of the original array.
    func chunked(into size: Int) -> [[Element]] {
        guard size > 0 else { return [] }
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
    
    /// Returns a new array where duplicate elements are removed, preserving the order of the original array.
    /// - Returns: A new array without duplicates.
    func removingDuplicates<T: Hashable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        var seen = Set<T>()
        return filter { seen.insert($0[keyPath: keyPath]).inserted }
    }
    
    /// Returns a new array where the elements are unique.
    /// - Returns: An array with only unique elements, preserving the order.
    func uniqueElements<T: Hashable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        var seen = Set<T>()
        return filter { seen.insert($0[keyPath: keyPath]).inserted }
    }
    
    /// Groups the elements of the array into a dictionary, keyed by the result of the given closure.
    /// - Parameter keyForValue: A closure that returns the key for each element.
    /// - Returns: A dictionary where the keys are the result of `keyForValue` and the values are arrays of elements.
    func groupBy<T: Hashable>(keyForValue: (Element) -> T) -> [T: [Element]] {
        Dictionary(grouping: self, by: keyForValue)
    }
}

extension Array where Element: Equatable {
    
    /// Removes all occurrences of a specific element from the array.
    /// - Parameter element: The element to be removed.
    /// - Returns: A new array without the specified element.
    func removingAllOccurrences(of element: Element) -> [Element] {
        return filter { $0 != element }
    }
    
    /// Checks if the array contains all elements from another array.
    /// - Parameter other: The array of elements to check for.
    /// - Returns: True if the array contains all elements of `other`.
    func containsAllElements(of other: [Element]) -> Bool {
        return other.allSatisfy { self.contains($0) }
    }
}
