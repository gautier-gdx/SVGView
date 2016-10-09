
**SVGView** is a new way to display SVG in your app


<p align="center">
<a href="#demo">Demo</a> • <a href="#installation">Installation</a> • <a href="#properties">Properties</a> • <a href="#methods">Methods</a> • <a href="#license">License</a>
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


## License

Copyright (c) 2015 Gautier Gédoux

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
