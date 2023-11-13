const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.defaultReleaseOptions();
    const exe = b.addExecutable("hello-world-server", "src/main.zig");
    exe.setBuildMode(mode);
    exe.install();
}
