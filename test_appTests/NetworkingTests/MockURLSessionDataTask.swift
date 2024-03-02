//
//  MockURLSessionDataTask.swift
//  test_appTests
//
//  Created by Chris Gutwin on 2024-03-01.
//

import Foundation

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    func resume() {
        closure()
    }
}
