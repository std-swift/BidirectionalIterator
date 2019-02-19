# BidirectionalIterator

[![](https://img.shields.io/badge/Swift-5.0-orange.svg)][1]
[![](https://img.shields.io/badge/os-macOS%20|%20Linux-lightgray.svg)][1]
[![](https://travis-ci.com/std-swift/BidirectionalIterator.svg?branch=master)][2]
[![](https://codecov.io/gh/std-swift/BidirectionalIterator/branch/master/graph/badge.svg)][3]
[![](https://codebeat.co/badges/4bb5989c-4fd1-4a07-ba5e-b6debb6f6322)][4]

[1]: https://swift.org/download/#releases
[2]: https://travis-ci.com/std-swift/BidirectionalIterator
[3]: https://codecov.io/gh/std-swift/BidirectionalIterator
[4]: https://codebeat.co/projects/github-com-std-swift-bidirectionaliterator-master

Provides a `BidirectionalIterator` for `BidirectionalCollection` types

## Importing

```Swift
import BidirectionalIterator
```

```Swift
dependencies: [
	.package(url: "https://github.com/std-swift/BidirectionalIterator.git",
	         from: "1.0.0")
],
targets: [
	.target(
		name: "",
		dependencies: [
			"BidirectionalIterator"
		]),
]
```

## Using

```Swift
let animals = ["Antelope", "Butterfly", "Camel", "Dolphin"]
var animalIterator = animals.makeBidirectionalIterator()
animalIterator.next()     // .some("Antelope")
animalIterator.next()     // .some("Butterfly")
animalIterator.previous() // .some("Butterfly")
animalIterator.next()     // .some("Butterfly")
```
