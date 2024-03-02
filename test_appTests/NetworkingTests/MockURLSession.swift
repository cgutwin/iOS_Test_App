//
//  MockURLSession.swift
//  test_appTests
//
//  Created by Chris Gutwin on 2024-03-01.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionTask: URLSessionDataTaskProtocol {}

class MockURLSession: URLSession {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> Void {
        let data = self.data
        let response = self.response
        let error = self.error
    }
}
