import { serve } from "https://deno.land/std/http/server.ts";

const server = serve({ hostname: "0.0.0.0", port: 8080 });
console.log("HTTP web server running at http://0.0.0.0:8080/");

server.forEach(async (req) => {
  req.respond({ body: "Hello World\n" });
});
