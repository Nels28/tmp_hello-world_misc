// build.zig

const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const exe = b.addExecutable("hello", "hello.zig");
    exe.setTarget(Target{
        .system = .Host,
        .arch = .x86_64,
        .os = .Linux,
    });
    exe.install();
}
