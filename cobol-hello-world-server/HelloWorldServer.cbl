       IDENTIFICATION DIVISION.
       PROGRAM-ID. HelloWorldServer.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  RESPONSE PIC X(100) VALUE 
           'HTTP/1.1 200 OK'^
           'Content-type: text/html'^
           '^'
           '<html><body>Hello, World!</body></html>'.

       01  SERVER-ADDRESS PIC X(16) VALUE "0.0.0.0".
       01  SERVER-PORT PIC 9(4) VALUE 8080.

       01  SERVER-SOCKET     USAGE IS POINTER.
       01  CLIENT-SOCKET     USAGE IS POINTER.
       01  SERVER-ADDR       USAGE IS POINTER.
       01  CLIENT-ADDR       USAGE IS POINTER.

       01  SOCKET-ADDRESS.
           05  FAMILY      PIC S9(4) COMP.
           05  PORT        PIC S9(4) COMP.
           05  ADDR        PIC X(32).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           MOVE LOW-VALUES TO SOCKET-ADDRESS.
           MOVE 2 TO FAMILY OF SOCKET-ADDRESS.
           MOVE SERVER-PORT TO PORT OF SOCKET-ADDRESS.
           MOVE SERVER-ADDRESS TO ADDR OF SOCKET-ADDRESS.
           CALL "C$SOCKET" USING BY VALUE 2, BY VALUE 1, 
                                   BY REFERENCE SOCKET-ADDRESS
                                   GIVING SERVER-SOCKET.

           IF SERVER-SOCKET < 0
               DISPLAY "Error: Unable to create socket"
               STOP RUN
           END-IF.

           PERFORM UNTIL FALSE
               CALL "C$ACCEPT" USING BY VALUE SERVER-SOCKET, 
                                       BY REFERENCE SOCKET-ADDRESS
                                       GIVING CLIENT-SOCKET
               IF CLIENT-SOCKET < 0
                   DISPLAY "Error: Unable to accept connection"
                   STOP RUN
               END-IF

               MOVE FUNCTION LENGTH OF RESPONSE TO LENGTH OF BUFFER.
               CALL "C$WRITE" USING BY VALUE CLIENT-SOCKET, 
                                      BY REFERENCE RESPONSE
                                      BY VALUE LENGTH OF BUFFER
                                      GIVING LENGTH OF RESPONSE.

               CALL "C$CLOSE" USING BY VALUE CLIENT-SOCKET.
           END-PERFORM.

           CALL "C$CLOSE" USING BY VALUE SERVER-SOCKET.

           STOP RUN.
