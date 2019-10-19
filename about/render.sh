#!/bin/bash

( head -n -2 wrap.html; pandoc resume.md; tail -2 wrap.html) >resume.html

