package main

import (
	"fmt"
	"io/ioutil"
	"os"
)

func reverseBytes(inputFile, outputFile string) error {
	// Read input file
	input, err := ioutil.ReadFile(inputFile)
	if err != nil {
		return fmt.Errorf("error reading input file: %w", err)
	}

	// Reverse the bytes
	reverse(input)

	// Write reversed bytes to output file
	err = ioutil.WriteFile(outputFile, input, os.ModePerm)
	if err != nil {
		return fmt.Errorf("error writing to output file: %w", err)
	}

	return nil
}

func reverse(input []byte) {
	left := 0
	right := len(input) - 1

	for left < right {
		input[left], input[right] = input[right], input[left]
		left++
		right--
	}
}

func main() {
	inputFile := "input.txt"
	outputFile := "output.txt"

	err := reverseBytes(inputFile, outputFile)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	fmt.Println("Bytes reversed successfully!")
}
