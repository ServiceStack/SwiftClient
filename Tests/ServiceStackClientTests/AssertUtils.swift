#if true
//
//  AssertUtils.swift
//  ServiceStackClientTests
//
//  Created by Demis Bellot on 1/22/15.
//  Copyright (c) 2015 ServiceStack LLC. All rights reserved.
//

import Foundation
import XCTest
@testable import ServiceStackClient


func assertEquals<T : Equatable>(expected:[T], actual:[T]) {
    XCTAssertEqual(expected.count, actual.count)
    
    for i in 0..<actual.count {
        XCTAssertEqual(expected[i], actual[i])
    }
}

#endif
