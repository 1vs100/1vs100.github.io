// Sends key presses to an Xbox in Dev Mode through the Device Portal remote
// input WebSocket, then saves a screenshot of the console screen.
//
// Usage: node xbox_input.js <out.png|-> <key>[*count] ...
//   XBOX=10.0.0.77 node xbox_input.js shot.png ddown*3 a
//
// Keys: up down left right enter esc space bksp tab, the gamepad keys
// a b x y menu view dup ddown dleft dright, or a hex code such as 0xC3.
// Needs Node 22 or newer (built-in WebSocket and fetch).
//
// Dev Home and system menus accept these keys. A game reads the controller
// directly and does not see them; see README.md.

process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0'; // The portal uses a self-signed certificate.
const fs = require('fs');

const VK = {
  bksp: 0x08, tab: 0x09, enter: 0x0d, esc: 0x1b, space: 0x20,
  left: 0x25, up: 0x26, right: 0x27, down: 0x28,
  a: 0xc3, b: 0xc4, x: 0xc5, y: 0xc6,
  dup: 0xcb, ddown: 0xcc, dleft: 0xcd, dright: 0xce,
  menu: 0xcf, view: 0xd0,
};
const host = process.env.XBOX || '10.0.0.77';
const portal = `https://${host}:11443`;
const [out, ...keys] = process.argv.slice(2);
const wait = ms => new Promise(resolve => setTimeout(resolve, ms));

function code(name) {
  const vk = name.startsWith('0x') ? parseInt(name, 16) : VK[name];
  if (vk === undefined) throw new Error(`unknown key ${name}`);
  return vk;
}

(async () => {
  const ws = new WebSocket(`wss://${host}:11443/ext/remoteinput`);
  await new Promise((resolve, reject) => { ws.onopen = resolve; ws.onerror = reject; });
  for (const key of keys) {
    const [, name, count] = /^(\w+?)(?:\*(\d+))?$/.exec(key);
    const vk = code(name);
    for (let i = 0; i < Number(count || 1); i++) {
      // Message: 0x01 (key), virtual key code, 1 = down / 0 = up.
      ws.send(new Uint8Array([1, vk, 1]));
      await wait(80);
      ws.send(new Uint8Array([1, vk, 0]));
      await wait(600);
    }
  }
  await wait(900);
  ws.close();
  if (out !== '-') {
    const reply = await fetch(`${portal}/ext/screenshot?download=true`);
    fs.writeFileSync(out, Buffer.from(await reply.arrayBuffer()));
  }
  process.exit(0);
})().catch(error => { console.error(error.message); process.exit(1); });
