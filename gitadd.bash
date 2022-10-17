#!/bin/bash
echo "Enter the comment name: "
read commentcontent
git add .
git commit -m "$commentcontent"
