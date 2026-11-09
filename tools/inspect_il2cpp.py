import os
import re

SO_PATH = r"D:\swordxstaff\game_assets\il2cpp\libil2cpp.so"
METADATA_PATH = r"D:\swordxstaff\game_assets\metadata\global-metadata.dat"

def inspect():
    print("=== IL2CPP & METADATA INSPECTION ===")
    if os.path.exists(SO_PATH):
        sz = os.path.getsize(SO_PATH)
        print(f"[+] libil2cpp.so: {sz:,} bytes ({sz / (1024*1024):.2f} MB)")
        with open(SO_PATH, "rb") as f:
            header = f.read(16)
            print(f"    ELF Header: {header[:4]} (valid: {header[:4] == b'\x7fELF'})")
            # find exported symbols
            f.seek(0)
            chunk = f.read(1024 * 1024 * 10)
            symbols = sorted(set(re.findall(b"il2cpp_[a-zA-Z0-9_]+", chunk)))
            print(f"    il2cpp exports in first 10MB: {len(symbols)} functions")
            for s in symbols[:10]:
                print(f"      - {s.decode()}")
    else:
        print(f"[-] Missing: {SO_PATH}")

    if os.path.exists(METADATA_PATH):
        sz = os.path.getsize(METADATA_PATH)
        print(f"[+] global-metadata.dat: {sz:,} bytes ({sz / (1024*1024):.2f} MB)")
        with open(METADATA_PATH, "rb") as f:
            data = f.read(16)
            import struct
            magic, ver = struct.unpack("<II", data[:8])
            print(f"    Magic: 0x{magic:08X} (Version: {ver})")
    else:
        print(f"[-] Missing: {METADATA_PATH}")

if __name__ == "__main__":
    inspect()
