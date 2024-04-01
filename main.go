package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	fmt.Println("Hello world")

	http.Handle("/")

	log.Fatal(http.ListenAndServe(":8080", nil))
}
