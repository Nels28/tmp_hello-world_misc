const std = @import("std");
const stdweb = @import("std").web;
const mem = std.mem;
const io = std.io;

pub fn main() void {
    const allocator = std.heap.page_allocator;
    var server = try stdweb.Server.init(allocator, .{
        .addr = try std.net.parseIp("0.0.0.0", 8080),
        .concurrency = 1,
    });

    defer server.deinit();
    server.setHandler(httpHandler);

    const result = server.run();
    if (result != .Success) {
        io.exit(1);
    }
}

fn httpHandler(_req: *stdweb.http.Request, res: *stdweb.http.Response) void {
    res.setContentType("text/plain");
    res.writeAll("HTTP/1.1 200 OK\n\n");
    res.writeAll("Hello, World!\n");
}
