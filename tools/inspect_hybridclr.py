import os
import glob

DIR_PATH = r"D:\swordxstaff\game_assets\hybridclr"

def inspect():
    print("=== HYBRIDCLR BYTECODE & METAVERSION INSPECTION ===")
    files = glob.glob(os.path.join(DIR_PATH, "*.mv.bytes"))
    if not files:
        print("[-] No .mv.bytes files found.")
        return

    print(f"Found {len(files)} HybridCLR meta files:")
    for fpath in sorted(files):
        fname = os.path.basename(fpath)
        size = os.path.getsize(fpath)
        with open(fpath, "rb") as f:
            header = f.read(16)
        magic = header[:4]
        print(f"  - {fname:38} | {size:>8} B | Magic: {magic} | Hex: {header[:8].hex()}")

    ver_file = os.path.join(DIR_PATH, "Version.json")
    if os.path.exists(ver_file):
        with open(ver_file, "r", encoding="utf-8") as f:
            print("\nVersion.json:")
            print(" ", f.read().strip())

if __name__ == "__main__":
    inspect()
