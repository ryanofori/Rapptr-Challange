//
//  Rapptr_iOS_TestTests.swift
//  Rapptr iOS TestTests
//
//  Created by Ryan Ofori on 8/11/22.
//

import XCTest
@testable import Rapptr_iOS_Test
enum JSONTestingError: Error {
    case fileNotFound
    case returnEmptyData
    case invalidJSON
    case parsingFailture
}
class JSONParser: NSObject {
    class func parse<T:Codable>(_ fileName: String, model: T.Type) -> Result<T, Error> {
        guard let filePath = Bundle(for: self).path(forResource: fileName, ofType: "json") else { return .failure(JSONTestingError.fileNotFound)}
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else {
            return .failure(JSONTestingError.returnEmptyData)
        }
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return .success(model)
        } catch {
            return .failure(error)
        }
    }
}
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

}
