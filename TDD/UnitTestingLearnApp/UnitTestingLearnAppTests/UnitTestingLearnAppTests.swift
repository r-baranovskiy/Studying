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
    
    func testHighesttValueShouldBe100() {
        // given
        sut.setValue(with: 120)
        // when
        let value = sut.value
        // then
        XCTAssert(value == 100, "Highest value should be equal 100")
    }
    
    func testNumberOneMustBeGreaterThanNumberTwo() {
        let numberOne = 10
        let numberTwo = 9
        
        let result = sut.greaterThanSecondValue(x: numberOne, y: numberTwo)
        
        XCTAssert(result, "The number one must be greater than number two")
    }
    
    func testNumberOneMustNotBeGreaterThanNumberTwo() {
        let numberOne = 10
        let numberTwo = 10
        
        let result = sut.greaterThanSecondValue(x: numberOne, y: numberTwo)
        
        XCTAssert(!result, "The number one must be greater than number two")
    }
    
    func testIsDivisibleByThree() {
        let result = sut.isDivisibleByThree(number: 3)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByThree() {
        let result = sut.isDivisibleByThree(number: 10)
        XCTAssertEqual(result, false)
    }
}
