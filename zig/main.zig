const std = @import("std");
const net = @import("std").net;

pub fn main() void {
    const address = try net.AddressIp4{ .addr = 0, .port = 8080 };
    const listener = try net.listenTcp4(address, net.ListenBacklog.multiple(10));

    while (true) {
        const result = try listener.accept();
        const connection = try result.connection();
        const buffer = try connection.reader().readUntilDelimiter(' ');

        try connection.writer().writeAll("HTTP/1.1 200 OK\r\n");
        try connection.writer().writeAll("Content-Type: text/plain\r\n");
        try connection.writer().writeAll("\r\n");
        try connection.writer().writeAll("Hello, World!\r\n");

        try connection.writer().flush();
        connection.close();
    }
}
