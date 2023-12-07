//
//  AuthTest.swift
//  qr_appTests
//
//  Created by Andy ⠀ on 06/12/23.
//

import XCTest
@testable import qr_app
import AuthService
import Models

final class AuthTest: XCTestCase {

    var sut: Auth!
    
    let user = User(id: 2, username: "john")
    
    override func setUp()
    {
        super.setUp()
        sut = Auth.current
    }
    
    override func tearDown()
    {
        sut.logout()
        sut = nil
        super.tearDown()
    }
    
    func testUserLoggedin() {
        sut.loggedIn(user: user)
        
        XCTAssertEqual(sut.user!.id, 2)
        XCTAssertEqual(sut.user!.username, "john")
    }
    
    func testUserLogout() {
        let user = User(id: 2, username: "john")
        sut.loggedIn(user: user)
        XCTAssertNotNil(sut.user)
        
        sut.logout()
        XCTAssertNil(sut.user)
    }
}
