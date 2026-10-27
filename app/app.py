import os
from http.server import BaseHTTPRequestHandler, HTTPServer

NAME = os.environ.get("STUDENT_NAME", "Farukh")
SURNAME = os.environ.get("STUDENT_SURNAME", "Makhmutkhodzhaev")
GROUP = os.environ.get("STUDENT_GROUP", "IT-2 2314")
STUDENT_ID = os.environ.get("STUDENT_ID", "37093")


def build_banner():
    return (
        "================================\n"
        "DevOps Student Application\n"
        "================================\n"
        "\n"
        f"Name: {NAME}\n"
        f"Surname: {SURNAME}\n"
        f"Group: {GROUP}\n"
        f"Student ID: {STUDENT_ID}\n"
        "\n"
        "Application is running successfully!\n"
    )


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        body = build_banner().encode()
        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, fmt, *args):
        print("%s - %s" % (self.address_string(), fmt % args), flush=True)


if __name__ == "__main__":
    print(build_banner(), flush=True)
    server = HTTPServer(("0.0.0.0", 8080), Handler)
    print("Listening on http://0.0.0.0:8080", flush=True)
    server.serve_forever()
