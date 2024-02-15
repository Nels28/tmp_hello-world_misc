package main

import (
	"fmt"
	"net/http"
	"github.com/IBM/zurich/cobol" // Add COBOL library dependency
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		message, err := cobol.RunHelloWorld() // Call COBOL program
		if err != nil {
			fmt.Fprintf(w, "Error: %v", err)
			return
		}
		fmt.Fprintf(w, message)
	})

	fmt.Println("Server listening on 0.0.0.0:8080")
	http.ListenAndServe(":8080", nil)
}

