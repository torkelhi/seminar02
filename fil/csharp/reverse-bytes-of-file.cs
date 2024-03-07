using System;
using System.IO;

class ReverseBytesOfFile
{
    static void Main(string[] args)
    {
        string inputFile = "input.txt";
        string outputFile = "output.txt";

        try
        {
            ReverseBytes(inputFile, outputFile);
            Console.WriteLine("Bytes reversed successfully!");
        }
        catch (Exception e)
        {
            Console.WriteLine("Error: " + e.Message);
        }
    }

    private static void ReverseBytes(string inputFileName, string outputFileName)
    {
        using (BinaryReader reader = new BinaryReader(File.Open(inputFileName, FileMode.Open)))
        {
            using (BinaryWriter writer = new BinaryWriter(File.Open(outputFileName, FileMode.Create)))
            {
                byte[] buffer = new byte[reader.BaseStream.Length];
                reader.Read(buffer, 0, (int)reader.BaseStream.Length);

                // Reverse the bytes
                Array.Reverse(buffer);

                writer.Write(buffer, 0, buffer.Length);
            }
        }
    }
}
