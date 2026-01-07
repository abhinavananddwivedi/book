#!/usr/bin/env Rscript

# Quick script to build the bookdown project
# Usage: Rscript build_book.R

message("Building Stochastic Calculus book...")

# Check if bookdown is installed
if (!require("bookdown", quietly = TRUE)) {
  message("Installing bookdown package...")
  install.packages("bookdown")
}

# Build the gitbook (HTML) version
message("Rendering gitbook (HTML) version...")
bookdown::render_book("index.Rmd", "bookdown::gitbook")

message("Done! The book has been built in the 'docs/' directory.")
message("You can open docs/index.html in your browser to view it locally.")
message("\nTo deploy to GitHub Pages:")
message("1. git add .")
message("2. git commit -m 'Update book'")
message("3. git push")
