//
//  Rapptr_iOS_TestTests.swift
//  Rapptr iOS TestTests
//
//  Created by Ryan Ofori on 8/11/22.
//

import XCTest
@testable import Rapptr_iOS_Test

class Rapptr_iOS_TestTests: XCTestCase {
    
    func testLoginSuccess() throws {
        
        let result = JSONParser.parse("LoginSuccess", model: LoginResponse.self)
        
        switch result {
        case .success(let model):
            XCTAssert(model.code == "Success", "found: \(model.code)")
            XCTAssert(model.message == "Login Successful!", "found: \(model.message)")
        case .failure(let error):
            XCTFail("Error type: \(error)")
        }
    }
    func testLoginFailure() throws {
        
        let result = JSONParser.parse("LoginFailure", model: LoginResponse.self)
        
        switch result {
        case .success(let model):
            XCTAssert(model.code == "Error", "found: \(model.code)")
            XCTAssert(model.message == "Invalid Parameters", "found: \(model.message)")
        case .failure(let error):
            XCTFail("Error type: \(error)")
        }
    }    
}
