#include <iostream>
using namespace std;

// Define the node structure
struct Node {
    int data;
    Node* next;
};

// Function to print all elements in the list
void printList(Node* node) {
    while (node != NULL) {
        cout << node->data << " ";
        node = node->next;
    }
    cout << endl;
}

int main() {
    // Create the head node
    Node* head = new Node;
    head->data = 1;

    // Create additional nodes and link them together
    Node* second = new Node;
    second->data = 2;
    head->next = second;

    Node* third = new Node;
    third->data = 3;
    second->next = third;

    // Print the list
    printList(head);

    // Clean up memory by deleting nodes
    delete head;
    delete second;
    delete third;

    return 0;
}
