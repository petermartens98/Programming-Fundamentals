/*
Vigenère cipher: This is a polyalphabetic cipher that uses a keyword to encrypt a message. It involves shifting 
each letter of the message by a different number of places down the alphabet, based on the corresponding letter of the keyword.
*/

#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

// Function to encrypt a message using the Vigenère cipher
string encrypt(string message, string keyword) {
    string encrypted_message = "";
    // Remove any non-alphabetic characters from the keyword
    keyword.erase(remove_if(keyword.begin(), keyword.end(), [](char c){return !isalpha(c);}), keyword.end());
    int keyword_len = keyword.length();
    int j = 0;
    for (int i = 0; i < message.length(); i++) {
        char c = message[i];
        // Check if the character is a letter
        if (isalpha(c)) {
            // Shift the character by the corresponding letter in the keyword
            char k = toupper(keyword[j % keyword_len]);
            c = toupper(c);
            c = (((c - 65) + (k - 65)) % 26) + 65;
            j++;
        }
        encrypted_message += c;
    }
    return encrypted_message;
}

int main() {
    string message;
    string keyword;
    cout << "Enter message: ";
    getline(cin, message);
    cout << "Enter keyword: ";
    getline(cin, keyword);
    // Encrypt the message using the Vigenère cipher
    string encrypted_message = encrypt(message, keyword);
    cout << "Encrypted message: " << encrypted_message << endl;
    return 0;
}
