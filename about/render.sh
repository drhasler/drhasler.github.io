#!/bin/bash

style=style.css
# https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.10.0/github-markdown.css

( head -n -2 wrap.html; pandoc resume.md; tail -2 wrap.html) >resume.html

