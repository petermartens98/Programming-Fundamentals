/*
Caesar cipher: This is a simple encryption technique that involves 
shifting each letter of a message by a certain number of places down 
the alphabet. It can be implemented using basic arithmetic operations.
*/

#include <iostream>
#include <string>
using namespace std;

// Function to encrypt a message using the Caesar cipher
string encrypt(string message, int shift) {
    string encrypted_message = "";
    for (int i = 0; i < message.length(); i++) {
        char c = message[i];
        // Check if the character is a letter
        if (isalpha(c)) {
            // Shift the character by the specified number of places
            c = toupper(c);
            c = (((c - 65) + shift) % 26) + 65;
        }
        encrypted_message += c;
    }
    return encrypted_message;
}

int main() {
    string message;
    int shift;
    cout << "Enter message: ";
    getline(cin, message);
    cout << "Enter shift amount: ";
    cin >> shift;
    // Encrypt the message using the Caesar cipher
    string encrypted_message = encrypt(message, shift);
    cout << "Encrypted message: " << encrypted_message << endl;
    return 0;
}
