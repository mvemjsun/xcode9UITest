import XCTest

extension XCUIElement {

    func existsAndVisible() -> Bool {
        return exists && isHittable
    }

    func size() -> CGSize {
        return frame.size
    }

    func isVisible() -> Bool {
        return isHittable
    }

}

extension XCTestCase {
    func waitForElement(_ element: XCUIElement, visibility visible: Bool = true, timeout time: Double = 5) {
        let predicate = visible == true ? NSPredicate(format: "isHittable = true") : NSPredicate(format: "isHittable = false")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        _ = XCTWaiter.wait(for: [expectation], timeout: time)
    }
}
