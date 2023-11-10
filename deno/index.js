import {serve} from 'https://deno.land/std/http/mod.ts';

const hostname = '0.0.0.0';
const port = 8080;

const server = serve({hostname, port}); // specify 0.0.0.0 as hostname (all addresses)
console.log(`Server running on port ${port}`);

for await (const req of server) {
  req.respond({body: 'hello world'});
}
