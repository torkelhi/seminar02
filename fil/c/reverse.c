#include <stdio.h>
#include <stdlib.h>

void reverseBytes(char *filename) {
    FILE *fp1, *fp2;
    char ch;
    long int count = 0;

    // Open the input file
    fp1 = fopen(filename, "rb");
    if(fp1 == NULL) {
        printf("Error opening file: %s", filename);
        exit(1);
    }

    // Determine the size of the file
    fseek(fp1, 0L, SEEK_END);
    count = ftell(fp1);

    // Set file pointer to end of file
    fseek(fp1, -1L, SEEK_END);

    // Open the output file
    fp2 = fopen("output.txt", "wb");
    if(fp2 == NULL) {
        printf("Error creating output file");
        fclose(fp1);
        exit(1);
    }

    // Write data to output file in reverse order
    while (count > 0) {
        ch = fgetc(fp1);
        fputc(ch, fp2);
        fseek(fp1, -2L, SEEK_CUR);
        count--;
    }

    printf("Bytes reversed successfully!");

    // Close the files
    fclose(fp1);
    fclose(fp2);
}

int main() {
    char filename[] = "input.txt";

    // Call the function to reverse the bytes
    reverseBytes(filename);

    return 0;
}
