IDENTIFICATION DIVISION.
PROGRAM-ID. USERINPUT.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NAME PIC X(20).

PROCEDURE DIVISION.
    DISPLAY "What is your name?"
    ACCEPT NAME
    DISPLAY "Hello, " NAME 
    STOP RUN.