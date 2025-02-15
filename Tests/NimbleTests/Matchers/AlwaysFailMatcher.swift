import XCTest
import Nimble
#if SWIFT_PACKAGE
import NimbleSharedTestHelpers
#endif

func alwaysFail<T>() -> Predicate<T> {
    return Predicate { _ throws -> PredicateResult in
        return PredicateResult(status: .fail, message: .fail("This matcher should always fail"))
    }
}

func asyncAlwaysFail<T>() -> AsyncPredicate<T> {
    return AsyncPredicate { _ throws -> PredicateResult in
        return PredicateResult(status: .fail, message: .fail("This matcher should always fail"))
    }
}

final class AlwaysFailTest: XCTestCase {
    func testAlwaysFail() {
        failsWithErrorMessage(
            "This matcher should always fail") {
            expect(true).toNot(alwaysFail())
        }

        failsWithErrorMessage(
            "This matcher should always fail") {
            expect(true).to(alwaysFail())
        }
    }

    func testAsyncAlwaysFail() async {
        await failsWithErrorMessage(
            "This matcher should always fail") {
            await expect(true).toNot(asyncAlwaysFail())
        }

        await failsWithErrorMessage(
            "This matcher should always fail") {
            await expect(true).to(asyncAlwaysFail())
        }
    }
}
