//
//  BidirectionalIterator.swift
//  BidirectionalIterator
//

public struct BidirectionalIterator<Elements>: IteratorProtocol where Elements: BidirectionalCollection {
	public typealias Index = Elements.Index
	public typealias Element = Elements.Element
	public typealias SubSequence = Elements.SubSequence
	
	private var collection: Elements
	private var currentIndex: Index
	
	/// - Returns: `true` iff `self.previous()` would return `nil`
	public var atStart: Bool {
		return self.currentIndex == self.collection.startIndex
	}
	
	/// - Returns: `true` iff `self.next()` would return `nil`
	public var atEnd: Bool {
		return self.currentIndex == self.collection.endIndex
	}
	
	internal init(bidirectionalCollection: Elements) {
		self.collection = bidirectionalCollection
		self.currentIndex = bidirectionalCollection.startIndex
	}
	
	public mutating func next(_ count: Int) -> SubSequence {
		let startIndex = self.currentIndex
		self.advance(by: count)
		return self.collection[startIndex..<self.currentIndex]
	}
	
	public mutating func previous(_ count: Int) -> ReversedCollection<SubSequence> {
		let endIndex = self.currentIndex
		self.reverse(by: count)
		return self.collection[self.currentIndex..<endIndex].reversed()
	}
	
	public func peek(_ count: Int) -> SubSequence {
		let endIndex = self.index(advancedBy: count)
		return self.collection[self.currentIndex..<endIndex]
	}
	
	public func peekPrevious(_ count: Int) -> ReversedCollection<SubSequence> {
		let startIndex = self.index(reversedBy: count)
		return self.collection[startIndex..<self.currentIndex].reversed()
	}
	
	public mutating func advance(by count: Int = 1) {
		self.currentIndex = self.index(advancedBy: count)
	}
	
	public mutating func reverse(by count: Int = 1) {
		self.currentIndex = self.index(reversedBy: count)
	}
	
	public func remaining() -> SubSequence {
		return self.collection[self.currentIndex..<self.collection.endIndex]
	}
	
	public func seen() -> ReversedCollection<SubSequence> {
		return self.collection[self.collection.startIndex..<self.currentIndex].reversed()
	}
}

extension BidirectionalIterator {
	@inlinable
	public var hasNext: Bool {
		return !self.atEnd
	}
	
	@inlinable
	public var hasPrevious: Bool {
		return !self.atStart
	}
	
	@inlinable
	public mutating func next() -> Element? {
		return self.next(1).first
	}
	
	@inlinable
	public mutating func previous() -> Element? {
		return self.previous(1).first
	}
	
	@inlinable
	public func peek() -> Element? {
		return self.peek(1).first
	}
	
	@inlinable
	public func peekPrevious() -> Element? {
		return self.peekPrevious(1).first
	}
	
	private func index(advancedBy distance: Int) -> Index {
		let end = self.collection.endIndex
		return self.collection.index(self.currentIndex,
		                             offsetBy: distance,
		                             limitedBy: end) ?? end
	}
	
	private func index(reversedBy distance: Int) -> Index {
		let start = self.collection.startIndex
		return self.collection.index(self.currentIndex,
		                             offsetBy: -distance,
		                             limitedBy: start) ?? start
	}
}

extension BidirectionalIterator: Collection {
	public var startIndex: Index {
		return self.collection.startIndex
	}
	
	public var endIndex: Index {
		return self.collection.endIndex
	}
	
	public func index(after index: Index) -> Index {
		return self.collection.index(after: index)
	}
	
	public subscript(position: Index) -> Element {
		get {
			return self.collection[position]
		}
		
		// Use `read {` when it becomes available in a later Swift release
//		_read {
//			yield self.collection[position]
//		}
	}
}
