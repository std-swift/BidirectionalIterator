// swift-tools-version:5.0
//
//  Package.swift
//  BidirectionalIterator
//

import PackageDescription

let package = Package(
	name: "BidirectionalIterator",
	products: [
		.library(
			name: "BidirectionalIterator",
			targets: ["BidirectionalIterator"]),
	],
	targets: [
		.target(
			name: "BidirectionalIterator",
			dependencies: []),
		.testTarget(
			name: "BidirectionalIteratorTests",
			dependencies: ["BidirectionalIterator"]),
	]
)
