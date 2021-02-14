import XCTest

import GithubAPITests

var tests = [XCTestCaseEntry]()
tests += GithubAPITests.allTests()
XCTMain(tests)
