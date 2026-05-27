import sys

def validate_stream():
    found_caveman = False
    for i, line in enumerate(sys.stdin):
        if i < 5 and "Caveman mode: ON" in line:
            found_caveman = True

        if i == 4 and not found_caveman:
            print("[ALERT] KRYTYCZNE NARUSZENIE TOKEN ECONOMY", flush=True)
            sys.exit(1)

        if "Loaded skill: cavecrew" in line:
            print("[ALERT] KRYTYCZNE NARUSZENIE TOKEN ECONOMY", flush=True)
            sys.exit(1)

        print(line, end='', flush=True)

    if not found_caveman:
        print("[ALERT] KRYTYCZNE NARUSZENIE TOKEN ECONOMY", flush=True)
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) > 1:
        try:
            with open(sys.argv[1], 'r') as f:
                lines = f.readlines()
                found = any("Caveman mode: ON" in line for line in lines[:5])
                if not found or any("Loaded skill: cavecrew" in line for line in lines):
                    print("[ALERT] KRYTYCZNE NARUSZENIE TOKEN ECONOMY")
                    sys.exit(1)
        except FileNotFoundError:
            sys.exit(1)
    else:
        validate_stream()
