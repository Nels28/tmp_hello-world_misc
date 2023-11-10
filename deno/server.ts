import { serve } from "https://deno.land/std/http/server.ts";

async function handler(req: Request) {
  return new Response("Hello, World!");
}

const server = serve({ hostname: "0.0.0.0", port: 8080 });

for await (const req of server) {
  req.respond(await handler(req));
}
