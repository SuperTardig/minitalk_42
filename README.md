# minitalk
The goal of this 42 school project is to create two programs, a server and a client, which can communicate between each other using unix signals. The server program prints it's PID at startup and waits to receive a message from a client. The client programs take the PID of the server and an arguments to represent what needs to be sent. The client transform each char of the input to binairy and uses SIGUSR1 and SIGUSR2 as 1 and 0. The server then receive the signals and interprets them as 1 and 0 to recreate the char.
# Bonus
The bonus for this project are as followed:
  - The server sends a message to the client after it finished receiving the message. I handled this by sending a null byte at the end of my message to let the server know the server know that the message was finished. It then sends a signal back to the client
  - Support for unicode characters, I didn't need to do anything special for this.
  # Usage
To use this project you need to:
1. Clone this repository
2. Go to the root of the repository
3. Run `make`
4. start the server with `./server`
5. start the client with `./client <pid> "<message>"`
