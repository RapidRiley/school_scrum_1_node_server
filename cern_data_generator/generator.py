import hashlib
from datetime import datetime
import random

def generate_data(row_count: int):
    output_csv = ""
    for i in range(0, row_count):
        col_1 = str(random.randrange(0, 99999))
        col_2 = str(random.randrange(0, 99999))
        col_3 = str(random.randrange(0, 99999))
        timestamp = datetime.now().strftime(
            "%Y-%h-%d_%H:%M:%S:%f"
        )
        output_csv += f"{col_1}, {col_2}, {col_3}, {timestamp}\n"
    return output_csv 


def write_test_data(content: str, timestamp: str):
    # Generate timestamp

    output_file = open(f"./data/test_data_{timestamp}.csv", "x")
    output_file.write(content)


def write_md5_hash(hash, timestamp: str):
    output_file = open(f"./data/test_data_{timestamp}.md5", "x")
    output_file.write(str(hash.hexdigest()))

def main():
    random.seed()
    row_count = random.randrange(1, 500000)

    generated_data: str = "COL_1, COL_2, COL_3, TIMESTAMP\n" + generate_data(row_count)
    timestamp: str = datetime.now().strftime("%Y-%h-%d_%H-%M-%S")
    generated_hash = hashlib.md5(generated_data.encode())

    write_test_data(generated_data, timestamp)
    write_md5_hash(generated_hash, timestamp)



if __name__ == "__main__":
    main();