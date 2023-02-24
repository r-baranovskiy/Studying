import XCTest
@testable import UnitTestingLearnApp

final class UnitTestingLearnAppTests: XCTestCase {
    
    var sut: ViewController!

    override func setUpWithError() throws {
        sut = ViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testLowestValueShouldBeZero() {
        // given
        sut.setValue(with: -1)
        // when
        let value = sut.value
        // then
        XCTAssert(value == 0, "Lowest value isn't zero")
    }
}
