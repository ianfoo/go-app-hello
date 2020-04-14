package main

import (
	"log"
	"net/http"
	"os"

	"github.com/maxence-charriere/go-app/v6/pkg/app"
)

func main() {
	h := &app.Handler{
		Title:  "go-app hello",
		Author: "Ian Molee, following the quick start",
	}
	port := "7777"
	if p := os.Getenv("PORT"); p != "" {
		port = p
	}
	if err := http.ListenAndServe(":"+port, h); err != nil {
		log.Fatal(err)
	}
}
