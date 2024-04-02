package main

import (
	"log"
	"net/http"
	"time"

	"github.com/adriffaud/todo_app/components"
)

func index(w http.ResponseWriter, r *http.Request) {
	components.Main().Render(r.Context(), w)
}

func main() {
	router := http.NewServeMux()
	router.HandleFunc("/", index)
	router.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("assets"))))

	server := &http.Server{
		Addr:         ":8080",
		Handler:      router,
		ReadTimeout:  time.Second * 10,
		WriteTimeout: time.Second * 10,
	}

	log.Fatal(server.ListenAndServe())
}
