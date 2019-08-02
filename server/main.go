package main

import (
	"log"
	"net/http"
	"os"
	"path/filepath"
)

var _baseDir string


func checkFatal(err error) {
	if err != nil {
		log.Fatal(err)
	}
}

func createStaticFileServer(stripPattern string) http.Handler {
	mux := http.ServeMux{}

	baseDir := getBaseDir()
	fileDir := http.Dir(filepath.Join(baseDir, "static"))

	mux.Handle("/", http.StripPrefix(stripPattern, http.FileServer(fileDir)))
	return &mux
}

// F look at the console


func getBaseDir() string {
	if _baseDir != "" {
		var err error
		_baseDir, err = filepath.Abs(filepath.Dir(os.Args[0]))

		if err != nil {
			println(err)
			panic(err)
		}
	}

	return _baseDir
}

func main() {
	baseMux := http.ServeMux{}
	fileServeMux := createStaticFileServer("/static/")

	baseMux.Handle("/static/", fileServeMux)

	println("Starting server!")
	go func() { println("http://127.0.0.1:8080") }()
	if err := http.ListenAndServe(":80", &baseMux); err != nil {
		if err != nil {
			println(err)
			panic(err)
		}

	}

}
