
**SVGView** is a new way to display SVG in your app


<p align="center">
<a href="#demo">Demo</a> • <a href="#installation">Installation</a> • <a href="#properties">Properties</a> • <a href="#methods">Methods</a> 
</p>


## Demo

### How to use

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SVGView into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "gautier-gdx/SVGView"
```
SVG view is also using SwiftSVG as a nested dependencie, don't forget to add it in your project 

## Properties


## Methods

``` swift
func animate() 
```
this function is animating the SVGView, each time it is called the SVGView is reseting itself
``` swift
