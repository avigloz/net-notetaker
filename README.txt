GOAL:
HTTP-based logging/note-taking.

Make a request to log something in a filename of your choice
(e.g POST http://localhost:1234/{filename}/{base64 encoded message})

Or, make a request to read from a file over the network.
(e.g GET http://localhost:1234/{filename})

If the file is password-protected, you must include a password.
(e.g GET http://localhost:1234/{filename}/{password in plaintext lol})