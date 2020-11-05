# debrailler
Iteration 1: Creating a Command Line Interface
Write a Ruby program that prints a line to the terminal like the one below:

$ ruby ./lib/night_writer.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
In the example above:

./lib/night_writer.rb is the path to your Ruby program.
message.txt is the name of an existing text file in your project directory.
braille.txt is the name that we would like to give to a file that we will create in iteration 2.
256 is the count of characters in your message.txt file.
In order to break this problem down further, you may wish to work on things in the following order:

Create a Ruby program that prints the sample line of text provided above no matter what arguments are provided from the command line.
Update your existing program so that the name of the file that it prints out changes based on the second input that the user provides from the command line.
Further update your program so that the number of characters it prints out changes based on the number of characters in the file that the user provides as the first argument that the user provides from the command line.
