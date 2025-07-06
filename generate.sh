#!/bin/bash

# Check for exactly 2 arguments
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <challenge_id> <language>"
  exit 1
fi

create_solution_template=""
create_go_solution_template() {
  local challenge_id="$1"
  go mod init "github.com/phhphc/leetcode/$challenge_id/go"
  echo -e "package challenge$challenge_id\n\n// TODO: Add solution" > "challenge$challenge_id.go"
}
create_rust_solution_template() {
  local challenge_id="$1"
  cargo init --vcs=none --lib --name="leetcode$challenge_id"
}
create_java_solution_template() {
  # TODO: add java solution template
  echo "TODO: add java solution template"
}

# Validate $1 is a number
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "Error: <challenge_id> must be a number."
  exit 1
fi

# Validate $2 is one of the accepted languages
case "$2" in
  go)
    create_solution_template="create_go_solution_template"
    ;;
  rust)
    create_solution_template="create_rust_solution_template"
    ;;
  java)
    create_solution_template="create_java_solution_template"
    ;;
  *)
    echo "Error: Unsupported language."
    exit 1
    ;;
esac

# Safely create solution folder
if [ -d "$1/$2" ]; then
  echo "Solution folder already exists."
  exit 1
else
  mkdir -p "$1/$2"
fi

# Create solution template
cd "$1/$2"
$create_solution_template "$1"
cd ../..

echo "Solution created successfully."
echo "Navigate to your solution directory with:"
echo "cd $1/$2"

