const std = @import("std");
const http = @import("std").http;

pub fn main() void {
    const allocator = std.heap.page_allocator;
    const server = http.Server.init(allocator, .{});

    const result = server.serve(.{
        .handler = handler,
        .port = 8080,
    });

    switch (result) {
        HttpError.Ok => {},
        HttpError.AllocFailed => |err| {
            std.debug.print("{}\n", .{err});
        },
        HttpError.BindFailed => |err| {
            std.debug.print("{}\n", .{err});
        },
    }
}

pub fn handler(request: *http.Request, response: *http.Response) void {
    response.status_code = 200;
    response.content_type = "text/plain";
    response.write("Hello, World!\n");
}
