import XCTest

import cURLLibTests

var tests = [XCTestCaseEntry]()
tests += cURLLibTests.allTests()
XCTMain(tests)
