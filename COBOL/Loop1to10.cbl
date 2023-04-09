IDENTIFICATION DIVISION.
PROGRAM-ID. LOOP-1-TO-10.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 COUNTER PIC 99 VALUE 0.

PROCEDURE DIVISION.
    PERFORM VARYING COUNTER FROM 1 BY 1 UNTIL COUNTER > 10
        DISPLAY COUNTER
    END-PERFORM.
    STOP RUN.
