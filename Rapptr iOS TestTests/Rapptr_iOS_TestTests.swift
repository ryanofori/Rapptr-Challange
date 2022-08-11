//
//  Rapptr_iOS_TestTests.swift
//  Rapptr iOS TestTests
//
//  Created by Ryan Ofori on 8/11/22.
//

import XCTest
@testable import Rapptr_iOS_Test

class Rapptr_iOS_TestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
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
    
    func testChat() throws {
        let result = JSONParser.parse("Chat", model: Message.self)
        switch result {
        case .success(let model):
            XCTAssert(model.name == "Error", "found: \(model.name)")
            XCTAssert(model.message == "Invalid Parameters", "found: \(model.message)")
        case .failure(let error):
            XCTFail("Error type: \(error)")
        }
    }
}
