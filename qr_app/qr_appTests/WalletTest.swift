//
//  WalletTest.swift
//  qr_appTests
//
//  Created by Andy ⠀ on 06/12/23.
//

import XCTest
import WalletServices
import Models
import Shared
import AuthService

@testable import qr_app
final class WalletTest: XCTestCase {

    var sut: WalletService!
    
    override func setUp()
    {
        super.setUp()
        sut = WalletService(user: User(id: 0, username: "-"), wallet: Wallet(balance: 0, transactionHistory: nil))
    }
    
    override func tearDown()
    {
        super.tearDown()
        UserPersistents.wallet = nil
        sut = nil
    }
    
    func testWalletBalance() {
        XCTAssertTrue(sut.balance == 0)
        
        sut.updateBalance(amount: 123)
        XCTAssertEqual(sut.balance, 123)
    }
    
    func testPaymentShouldCutBalance() {
        sut.updateBalance(amount: 1000)
        XCTAssertEqual(sut.balance, 1000)
        
        try! sut.makePayment(data: TransactionModel(bankName: "", id: "", merchant: "", amount: 500))
        XCTAssertEqual(sut.balance, 500)
    }

    func testPaymentBalanceNotEnough() {
        sut.updateBalance(amount: 1000)
        
        XCTAssertThrowsError(try sut.makePayment(data: TransactionModel(bankName: "", id: "", merchant: "", amount: 20000)), PaymentError.insufficientBalance.errorDescription!)
    }
    
    func testStorePaymentHistory() {
        let transaction1 = TransactionModel(bankName: "bni", id: "1", merchant: "mockmerchant", amount: 100)
        let transaction2 = TransactionModel(bankName: "bri", id: "2", merchant: "mockmerchant", amount: 100)
        
        sut.updateBalance(amount: 1000)
        
        XCTAssertNoThrow(try sut.makePayment(data: transaction1))
        XCTAssertNoThrow(try sut.makePayment(data: transaction2))
        
        let history1 = sut.transactionHistory![0]
        let history2 = sut.transactionHistory![1]
        XCTAssertEqual(history1.bankName, "bni")
        XCTAssertEqual(history2.bankName, "bri")
    }
    
    func testClearWalletWhenLogout() {
        XCTAssertNotNil(UserPersistents.wallet)
        
        Auth.current.logout()
        
        XCTAssertNil(UserPersistents.wallet)
    }
}
