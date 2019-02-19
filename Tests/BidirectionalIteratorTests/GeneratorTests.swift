//
//  GeneratorTests.swift
//  BidirectionalIteratorTests
//

import XCTest
import BidirectionalIterator

final class GeneratorTests: XCTestCase {
	var iterator: BidirectionalIterator<(Range<Int>)>! = nil
	
	override func setUp() {
		self.iterator = (0..<5).makeBidirectionalIterator()
	}
	
	override func tearDown() {
		self.iterator = nil
	}
	
	func testNext() {
		XCTAssertEqual(iterator.next(), 0)
		XCTAssertEqual(iterator.next(), 1)
		XCTAssertEqual(iterator.next(), 2)
		XCTAssertEqual(iterator.next(), 3)
		XCTAssertEqual(iterator.next(), 4)
		XCTAssertEqual(iterator.next(), nil)
		XCTAssertEqual(iterator.next(), nil)
	}
	
	func testPrevious() {
		XCTAssertEqual(iterator.previous(), nil)
		XCTAssertEqual(iterator.previous(), nil)
		iterator.advance()
		XCTAssertEqual(iterator.previous(), 0)
		XCTAssertEqual(iterator.previous(), nil)
		XCTAssertEqual(iterator.previous(), nil)
	}
	
	func testPeek() {
		XCTAssertEqual(iterator.peek(), 0)
		XCTAssertEqual(iterator.peek(), 0)
		iterator.advance()
		XCTAssertEqual(iterator.peek(), 1)
		XCTAssertEqual(iterator.peek(), 1)
		iterator.advance(by: 4)
		XCTAssertEqual(iterator.peek(), nil)
		XCTAssertEqual(iterator.peek(), nil)
	}
	
	func testPeekPrevious() {
		XCTAssertEqual(iterator.peekPrevious(), nil)
		XCTAssertEqual(iterator.peekPrevious(), nil)
		iterator.advance()
		XCTAssertEqual(iterator.peekPrevious(), 0)
		XCTAssertEqual(iterator.peekPrevious(), 0)
		iterator.reverse()
		XCTAssertEqual(iterator.peekPrevious(), nil)
		XCTAssertEqual(iterator.peekPrevious(), nil)
	}
	
	func testNextCount() {
		XCTAssertEqual(iterator.next(1), 0..<1)
		XCTAssertEqual(iterator.next(3), 1..<4)
		XCTAssertEqual(iterator.next(5), 4..<5)
		XCTAssertEqual(iterator.next(5), 5..<5)
	}
	
	func testPreviousCount() {
		XCTAssertEqual(Array(iterator.previous(3)), [])
		iterator.advance(by: 2)
		XCTAssertEqual(Array(iterator.previous(3)), [1,0])
		XCTAssertEqual(Array(iterator.previous(3)), [])
	}
	
	func testPeekCount() {
		XCTAssertEqual(iterator.peek(1), 0..<1)
		XCTAssertEqual(iterator.peek(3), 0..<3)
		iterator.advance(by: 3)
		XCTAssertEqual(iterator.peek(5), 3..<5)
		XCTAssertEqual(iterator.peek(5), 3..<5)
	}
	
	func testPeekPreviousCount() {
		XCTAssertEqual(Array(iterator.peekPrevious(3)), [])
		iterator.advance(by: 2)
		XCTAssertEqual(Array(iterator.peekPrevious(3)), [1,0])
		XCTAssertEqual(Array(iterator.peekPrevious(3)), [1,0])
	}
	
	func testAdvance() {
		XCTAssertEqual(iterator.peek(), 0)
		iterator.advance()
		XCTAssertEqual(iterator.peek(), 1)
		iterator.advance()
		XCTAssertEqual(iterator.peek(), 2)
	}
	
	func testReverse() {
		iterator.advance()
		XCTAssertEqual(iterator.peek(), 1)
		iterator.reverse()
		XCTAssertEqual(iterator.peek(), 0)
		iterator.reverse()
		XCTAssertEqual(iterator.peek(), 0)
	}
	
	func testAdvanceBy() {
		XCTAssertEqual(iterator.peek(), 0)
		iterator.advance(by: 2)
		XCTAssertEqual(iterator.peek(), 2)
		iterator.advance(by: 4)
		XCTAssertEqual(iterator.peek(), nil)
	}
	
	func testReverseBy() {
		iterator.advance(by: 7)
		XCTAssertEqual(iterator.peek(), nil)
		iterator.reverse(by: 2)
		XCTAssertEqual(iterator.peek(), 3)
		iterator.reverse(by: 9)
		XCTAssertEqual(iterator.peek(), 0)
	}
	
	func testRemaining() {
		iterator.advance(by: 3)
		XCTAssertEqual(iterator.remaining(), 3..<5)
	}
	
	func testSeen() {
		iterator.advance(by: 3)
		XCTAssertEqual(Array(iterator.seen()), [2,1,0])
	}
	
	func testForEach() {
		var result = [Int]()
		iterator.forEach { result.append($0) }
		XCTAssertEqual(result, Array(0..<5))
	}
}
