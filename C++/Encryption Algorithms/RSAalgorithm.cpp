/*
RSA algorithm: This is a popular public-key encryption algorithm that is widely used for secure communication 
over the internet. It involves generating a pair of public and private keys, where the public key is used to encrypt messages 
*/

#include <iostream>
#include <cmath>
#include <cstdlib>
#include <ctime>
using namespace std;

// Function to check if a number is prime
bool is_prime(int n) {
    if (n <= 1) {
        return false;
    }
    for (int i = 2; i <= sqrt(n); i++) {
        if (n % i == 0) {
            return false;
        }
    }
    return true;
}

// Function to generate a random prime number
int generate_prime() {
    int p;
    do {
        p = rand() % 100 + 2; // Generate a random number between 2 and 101
    } while (!is_prime(p));
    return p;
}

// Function to calculate the greatest common divisor of two numbers
int gcd(int a, int b) {
    if (b == 0) {
        return a;
    }
    return gcd(b, a % b);
}

// Function to generate the public and private keys
void generate_keys(int& n, int& e, int& d) {
    // Generate two random prime numbers
    int p = generate_prime();
    int q = generate_prime();
    n = p * q; // Calculate n
    int phi_n = (p - 1) * (q - 1); // Calculate Euler's totient function of n
    do {
        // Generate a random number between 2 and phi_n - 1
        e = rand() % (phi_n - 2) + 2;
    } while (gcd(e, phi_n) != 1); // Ensure that e and phi_n are coprime
    // Calculate the modular multiplicative inverse of e modulo phi_n
    int k = 1;
    while (true) {
        d = (k * phi_n + 1) / e;
        if (d * e == k * phi_n + 1) {
            break;
        }
        k++;
    }
}

// Function to encrypt a message using the public key
int encrypt(int message, int n, int e) {
    return static_cast<int>(pow(message, e)) % n;
}

// Function to decrypt a message using the private key
int decrypt(int message, int n, int d) {
    return static_cast<int>(pow(message, d)) % n;
}

int main() {
    srand(time(NULL)); // Seed the random number generator
    int n, e, d;
    generate_keys(n, e, d); // Generate the public and private keys
    int message;
    cout << "Enter message (integer): ";
    cin >> message;
    // Encrypt the message using the public key
    int encrypted_message = encrypt(message, n, e);
    cout << "Encrypted message: " << encrypted_message << endl;
    // Decrypt the message using the private key
    int decrypted_message = decrypt(encrypted_message, n, d);
    cout << "Decrypted message: " << decrypted_message << endl;
    return 0;
}
