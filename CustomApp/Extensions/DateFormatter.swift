import Foundation

// MARK: - DateFormatter Extensions

extension DateFormatter {
    
    /// A shared `DateFormatter` instance to avoid creating multiple formatters in memory.
    static let shared = DateFormatter()

    /// Configures the `DateFormatter` with the provided date and time styles.
    /// - Parameters:
    ///   - dateStyle: The style for formatting the date (e.g., `.short`, `.medium`, `.long`).
    ///   - timeStyle: The style for formatting the time (e.g., `.short`, `.medium`, `.long`).
    /// - Returns: A `DateFormatter` configured with the specified styles.
    static func configured(with dateStyle: DateFormatter.Style, and timeStyle: DateFormatter.Style) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter
    }

    /// Converts a `Date` to a string in the specified format.
    /// - Parameter date: The `Date` to format.
    /// - Parameter format: A custom format string (e.g., "yyyy-MM-dd HH:mm").
    /// - Returns: A string representation of the date in the specified format.
    static func string(from date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }

    /// Converts a string to a `Date` using the specified format.
    /// - Parameters:
    ///   - string: The date string to parse.
    ///   - format: The format of the date string (e.g., "yyyy-MM-dd").
    /// - Returns: The `Date` if parsing was successful, or `nil` if the string was invalid.
    static func date(from string: String, format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: string)
    }

    /// Converts a `Date` to a string with a relative date style (e.g., "Today", "Tomorrow").
    /// - Parameter date: The `Date` to format.
    /// - Returns: A relative date string (e.g., "Today", "Tomorrow", or "in 3 days").
    static func relativeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.doesRelativeDateFormatting = true
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
