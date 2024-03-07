use std::io;
use std::io::Read;
use std::io::prelude::*;
use std::io::BufReader;
use std::fs::File;

fn main() -> io::Result<()> {
    
    let f = File::open("input.txt")?;
    let mut reader = BufReader::new(f);
    let mut buffer = Vec::new();

    // Read file into vector.
    reader.read_to_end(&mut buffer)?;

    let mut pos = 0;
    //let buffer_reversed: Vec<u8> = buffer.iter().rev().collect();
    let mut buffer_out = File::create("output.txt")?;

    //print!("{}\n", buffer[0]);

    buffer.reverse();

    //print!("{}", buffer[0]);

    while pos < buffer.len() {
        let bytes_written = buffer_out.write(&buffer[pos..])?;
        pos += bytes_written;
    }

    print!("{}\n", "Bytes reversed successfully!");

    Ok(())
}
