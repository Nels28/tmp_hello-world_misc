const std = @import("std");

pub fn main() !void {
    const allocator = std.testing.allocator;
    var address = try std.net.Address.parseIp4("0.0.0.0", 8080, allocator);
    const listener = try std.net.tcpListen(allocator, address);

    while (true) {
        const accept = try listener.accept(allocator);
        const writer = accept.writer();
        const buffer = try allocator.alloc(u8, 12);
        const n = std.mem.copy(buffer, "Hello, World!\n");

        try writer.write(buffer[0..n]);
    }
}
