#if true
//
//  DateExtensionsTests.swift
//  ServiceStackClient
//
//  Created by Demis Bellot on 1/31/15.
//  Copyright (c) 2015 ServiceStack LLC. All rights reserved.
//

import Foundation
import XCTest
@testable import ServiceStackClient

class DateExtensionsTests: XCTestCase {

    func test_Can_Parse_WCF_Date() {
        XCTAssertEqual(Date.fromString("/Date(978325200000-0000)/")!, Date(year: 2001, month: 1, day: 1))
        XCTAssertEqual(Date.fromString("/Date(978325200000+0000)/")!, Date(year: 2001, month: 1, day: 1))
    }
    
    func test_Can_parse_pre_UnixTime(){
        XCTAssertEqual(Date.fromString("\\/Date(-30610224000)\\/")!, Date(timeIntervalSince1970: -30610224000 / 1000))
    }
    
    func test_Can_Parse_ISO8601_Date() {
        print("2001-01-01T00:00:00".length)
        XCTAssertEqual(Date.fromString("2001-01-01T00:00:00.0000000")!, Date(year: 2001, month: 1, day: 1))
        XCTAssertEqual(Date.fromString("2001-01-01T00:00:00.000")!, Date(year: 2001, month: 1, day: 1))
        XCTAssertEqual(Date.fromString("2001-01-01T00:00:00")!, Date(year: 2001, month: 1, day: 1))

        XCTAssertEqual(Date.fromString("2001-01-01T05:00:00.000Z")!, Date(year: 2001, month: 1, day: 1))
    }
    
    func test_Can_Serialize_ISO8601_Date() {
        XCTAssertEqual(Date(year: 2001, month: 1, day: 1).isoDateString, "2001-01-01T05:00:00.000Z")
    }
    
    func test_Can_Serialize_Wcf_Json_Date() {
        XCTAssertEqual(Date(year: 2001, month: 1, day: 1).toJson(), "\"/Date(978325200000-0000)/\"")
    }
    
    func test_Can_Serialize_TimeInterval() {
        XCTAssertEqual(TimeInterval.fromTimeIntervalString("P365D")!, Double(365 * 24 * 60 * 60))
        XCTAssertEqual(TimeInterval.fromTimeIntervalString("PT1H")!, Double(1 * 60 * 60))
        XCTAssertEqual(TimeInterval.fromTimeIntervalString("PT1M")!, Double(1 * 60))
        XCTAssertEqual(TimeInterval.fromTimeIntervalString("PT1S")!, Double(1))
        XCTAssertEqual(TimeInterval.fromTimeIntervalString("PT0.001S")!, Double(0.001))

        //1year + 1day + 1hr + 1min + 1s + 1ms
        XCTAssertEqual(TimeInterval.fromTimeIntervalString("P365DT1H1M1.001S")!, 31539661.001)
    }
}
    
#endif
