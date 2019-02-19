//
//  Collection+BidirectionalIterator.swift
//  BidirectionalIterator
//

extension BidirectionalCollection {
	public func makeBidirectionalIterator() -> BidirectionalIterator<Self> {
		return BidirectionalIterator(bidirectionalCollection: self)
	}
}
