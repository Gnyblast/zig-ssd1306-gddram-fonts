const std = @import("std");
pub const Fonts = @import("./fonts.zig");

comptime {
    std.testing.refAllDecls(@This());
}
