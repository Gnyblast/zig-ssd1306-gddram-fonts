# zig-ssd1306-gddram-fonts

A Zig font library for SSD1306 OLED screens, designed to print text using GDDRAM.  
This library provides easy-to-use font routines compatible with Zig-based firmware for embedded devices.

## Features

- 8x8 pixel font for SSD1306 OLED screens
- Draws text directly to a buffer or via allocator
- Designed for Zig firmware targeting microcontrollers
- Simple integration with Zig's package manager
- Supports Zig v0.14+

## Installation

Fetch the library and save it to your dependencies:

```sh
zig fetch --save=font8x8 git+https://github.com/Gnyblast/zig-ssd1306-gddram-fonts
```

Add to your `build.zig`:

```zig
const font8x8 = b.dependency("font8x8", .{});
firmware.add_app_import("font8x8", font8x8.module("font8x8"), .{})
```

## Usage

### Import Fonts

```zig
const font8x8 = @import("font8x8").Fonts;
```

### Draw to Buffer

```zig
var buff: [88]u8 = undefined; // 8*str.len because it's 1 byte font
var printable = font8x8.draw(&buff, "Hello World");
lcd.write_gdram(printable);
```

### Draw via Allocator (if MCU supports)

```zig
var da = std.heap.DebugAllocator(.{}){};
var alloc = da.allocator();
var printable = font8x8.drawAlloc(alloc, "Hello World");
defer alloc.free(printable);
lcd.write_gdram(printable);
```

## Requirements

- Zig v0.14 or later
- SSD1306-compatible display
- Zig build system (`build.zig`)

## License

MIT

## Author

[Gnyblast](https://github.com/Gnyblast)
