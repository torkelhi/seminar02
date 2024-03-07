def reverse_bytes(input_file, output_file):
    with open(input_file, 'rb') as f:
        content = f.read()

    reversed_content = content[::-1]

    with open(output_file, 'wb') as f:
        f.write(reversed_content)

    print("Bytes reversed successfully!")

if __name__ == "__main__":
    input_file = "input.txt"
    output_file = "output.txt"

    reverse_bytes(input_file, output_file)
