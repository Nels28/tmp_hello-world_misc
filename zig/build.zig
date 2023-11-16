// build.zig

const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const exe = b.addExecutable("hello", "hello.zig");
    exe.setTarget(.{
        .architecture = .x86_64,
        .os = .Linux,
        .environment = .Native,
    });
    exe.install();
}
