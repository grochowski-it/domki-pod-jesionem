import sys

def validate(text):
    if not text.startswith("Caveman mode: ON"):
        print("[ALERT] KRYTYCZNE NARUSZENIE TOKEN ECONOMY")
        sys.exit(1)

    if "Loaded skill: cavecrew" in text:
        print("[ALERT] KRYTYCZNE NARUSZENIE TOKEN ECONOMY")
        sys.exit(1)

    sys.exit(0)

if __name__ == "__main__":
    if len(sys.argv) > 1:
        try:
            with open(sys.argv[1], 'r') as f:
                content = f.read()
                validate(content)
        except FileNotFoundError:
            sys.exit(1)
    else:
        content = sys.stdin.read()
        validate(content)
