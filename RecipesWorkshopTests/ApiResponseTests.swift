//
//  ApiResponseTests.swift
//  RecipesWorkshopTests
//
//  Created by JETS Mobile Lab8 on 27/05/2023.
//

import XCTest
@testable import RecipesWorkshop
final class ApiServiceTests: XCTestCase {

    var sut : NetworkServicing!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = NetworkManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    func testgetDataOverNetwork(){
        let expectation = XCTestExpectation(description: "RecipesDownloaded")
        var responseResult : Result?
        
        guard let bundle = Bundle.unitTest.path(forResource: "ApiResponse", ofType: "json")else{
            XCTFail("recipes not found")
            return
        }
        
        sut.getDataOverNetwork(tag: bundle, endPoint: .recipes,compilitionHandler: { recipes in
            responseResult=recipes
            expectation.fulfill()
        })
        wait(for: [expectation],timeout: 5)
        
        XCTAssertNotNil(responseResult)
    }

}
