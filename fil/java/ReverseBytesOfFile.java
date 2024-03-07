
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class ReverseBytesOfFile {

    public static void main(String[] args) {
        String inputFile = "input.txt";
        String outputFile = "output.txt";

        try {
            reverseBytes(inputFile, outputFile);
            System.out.println("Bytes reversed successfully!");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void reverseBytes(String inputFileName, String outputFileName) throws IOException {
        File inputFile = new File(inputFileName);
        File outputFile = new File(outputFileName);

        FileInputStream inputStream = new FileInputStream(inputFile);
        FileOutputStream outputStream = new FileOutputStream(outputFile);

        byte[] buffer = new byte[(int) inputFile.length()];

        // Read bytes from input file
        inputStream.read(buffer);

        // Reverse the bytes
        reverseArray(buffer);

        // Write reversed bytes to output file
        outputStream.write(buffer);

        // Close the streams
        inputStream.close();
        outputStream.close();
    }

    private static void reverseArray(byte[] arr) {
        int i = 0;
        int j = arr.length - 1;

        while (i < j) {
            byte temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
            i++;
            j--;
        }
    }
}
