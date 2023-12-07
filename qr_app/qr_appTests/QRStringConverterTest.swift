//
//  QRStringConverterTest.swift
//  qr_appTests
//
//  Created by Andy ⠀ on 07/12/23.
//

import XCTest
import Shared
import Models

@testable import qr_app
final class QRStringConverterTest: XCTestCase {
    
    override func setUp()
    {
        super.setUp()
      
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testValidQRString() {
        let converter = QrStringConverter(qrString: "BNI.ID12345678.MERCHANT MOCK TEST.50000")
        switch converter.convertToTransactionModel() {
        case .success(let data):
            XCTAssertEqual(data.bankName, "BNI")
            XCTAssertEqual(data.id, "ID12345678")
            XCTAssertEqual(data.merchant, "MERCHANT MOCK TEST")
            XCTAssertEqual(data.amount, 50000)
            break
        case .failure(_):
            XCTFail()
        }
    }

    func testInvalidQRString() {
        let converter = QrStringConverter(qrString: "abcd.efg")
        let res: Result<TransactionModel, QRConverterError> = converter.convertToTransactionModel()
        
        guard case .failure(let error) = res else {
            return XCTFail("Expected to be a fail but got a success")
        }

        XCTAssertEqual(error.errorDescription, QRConverterError.qrStringError.errorDescription)
    }
}
