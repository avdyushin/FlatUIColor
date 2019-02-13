# UIColor extension
## Includes some Flat UI color schemes

This extension brings some convenience initializers into UIColor object and useful methods and calculated variables.

### Create color with CSS hex string

```swift
let red = UIColor(string: "#FF0000")
```

### Create color with hex integer representation

```swift
let green = UIColor(hex: 0x00FF00)
```

### Convert color to hex integer representation

```swift
let hex = UIColor.blue.asInt
// hex = 255
```

### Convert color to CSS hex string representation

```swift
let string = UIColor.yellow.asHexString
// string = "#ffff00"
```

### Make color lighter

```swift
let lightOrange = UIColor.orange.lighterColor
// "#ff9f3f"
```

### Make color darker

```swift
let darkOrange = UIColor.orange.darkerColor
// "#bf5f00"
```

### Flat UI colors

```swift
let greenSea = UIColor.flatGreenSea
let veryBerry = UIColor.flatVeryBerry
```

#### Usage

Add `UIColor.swift` into your project

#### Links
[http://flatuicolors.com/](http://flatuicolors.com/)
