//
//  ErrorTests.swift
//  SwiftyReceiptValidatorTests
//
//  Created by Dominik Ringler on 18/01/2020.
//  Copyright © 2020 Dominik. All rights reserved.
//

import XCTest
@testable import SwiftyReceiptValidator

class ErrorTests: XCTestCase {
    
    // MARK: - Status Code
    
    func test_statusCode_invalidStatusCode() {
        XCTAssertEqual(SRVError.invalidStatusCode(.valid).statusCode, .valid)
    }
    
    func test_statusCode_noReceiptFoundInResponse() {
        XCTAssertEqual(SRVError.noReceiptFoundInResponse(.valid).statusCode, .valid)
    }
    
    func test_statusCode_bundleIdNotMatching() {
        XCTAssertEqual(SRVError.bundleIdNotMatching(.valid).statusCode, .valid)
    }
    
    func test_statusCode_productIdNotMatching() {
        XCTAssertEqual(SRVError.productIdNotMatching(.valid).statusCode, .valid)
    }
    
    func test_statusCode_noValidSubscription() {
        XCTAssertEqual(SRVError.subscriptionExpired(.valid).statusCode, .valid)
    }
    
    func test_statusCode_cancelled() {
        XCTAssertEqual(SRVError.cancelled(.valid).statusCode, .valid)
    }
    
    func test_statusCode_other() {
        let expectedError = URLError(.notConnectedToInternet)
        XCTAssertNil(SRVError.other(expectedError).statusCode)
    }

    // MARK: Description
    
    func test_description_invalidStatusCode() {
        XCTAssertEqual(
            SRVError.invalidStatusCode(.unknown).localizedDescription,
            LocalizedString.Error.Validator.invalidStatusCode
        )
    }
  
    func test_description_noReceiptFoundInResponse() {
        XCTAssertEqual(
            SRVError.noReceiptFoundInResponse(.valid).localizedDescription,
            LocalizedString.Error.Validator.noReceiptFoundInResponse
        )
    }
    
    func test_description_bundleIdNotMatching() {
        XCTAssertEqual(
            SRVError.bundleIdNotMatching(.valid).localizedDescription,
            LocalizedString.Error.Validator.bundleIdNotMatching
        )
    }
    
    func test_description_productIdNotMatching() {
        XCTAssertEqual(
            SRVError.productIdNotMatching(.valid).localizedDescription,
            LocalizedString.Error.Validator.productIdNotMatching
        )
    }
    
    func test_description_noValidSubscription() {
        XCTAssertEqual(
            SRVError.subscriptionExpired(.valid).localizedDescription,
            LocalizedString.Error.Validator.noValidSubscription
        )
    }
    
    func test_description_cancelled() {
        XCTAssertEqual(
            SRVError.cancelled(.valid).localizedDescription,
            LocalizedString.Error.Validator.cancelled
        )
    }
    
    func test_description_other() {
        let expectedError = URLError(.notConnectedToInternet)
        XCTAssertEqual(
            SRVError.other(expectedError).localizedDescription,
            expectedError.localizedDescription
        )
    }
}
