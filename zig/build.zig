// build.zig
const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const target = b.standardTargetOptions(.{});

    const exe = b.addExecutable("hello-world", "main.zig");
    exe.setTarget(target);
    exe.install();
}
