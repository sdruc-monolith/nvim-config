#!/usr/bin/env python3
from http.server import BaseHTTPRequestHandler, HTTPServer
import subprocess


class Handler(BaseHTTPRequestHandler):
    def do_POST(self):
        length = int(self.headers.get("Content-Length", 0))
        data = self.rfile.read(length)
        # Try common clipboard utilities:
        for cmd in (["pbcopy"], ["xclip", "-selection", "clipboard"], ["wl-copy"]):
            try:
                p = subprocess.Popen(cmd, stdin=subprocess.PIPE)
                p.communicate(data)
                break
            except FileNotFoundError:
                continue
        self.send_response(200)
        self.end_headers()


if __name__ == "__main__":
    HTTPServer(("localhost", 8765), Handler).serve_forever()
