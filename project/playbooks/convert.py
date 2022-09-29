#!/usr/bin/env python3
# Class that attempts to parse out Juniper JSON into set format
#   I think it works? still testing
#
#   TODO: 
#      accumulate annotations and provide them as commands at the end. Will be weird as annotations have to be done after an edit command
from argparse import ArgumentParser, RawTextHelpFormatter
import sys, os, re

class TokenStack():
    def __init__(self):
        self._tokens = []

    def push(self, token):
        self._tokens.append(token)

    def pop(self):
        if not self._tokens:
            return None
        item = self._tokens[-1]
        self._tokens = self._tokens[:-1]
        return item

    def peek(self):
        if not self._tokens:
            return None
        return self._tokens[-1]

    def __str__(self):
        return " ".join(self._tokens)

    def __repr__(self):
        return " ".join(self._tokens)

def main():
    # get file
    a = ArgumentParser(prog="convert_jpr_json",
            description="This program takes in Juniper style JSON (blah { format) and prints it in a copy pastable display set format",
            epilog=f"Either supply with a filename or pipe config contents into this program and it'll print out the display set view.\nEx:\n{B}convert_jpr_json <FILENAME>\ncat <FILENAME> | convert_jpr_json{WHITE}",
            formatter_class=RawTextHelpFormatter)
    a.add_argument('file', help="juniper config in JSON format", nargs="?")
    args = a.parse_args()
    if not args.file and os.isatty(0):
        a.print_help()
        die("Please supply filename or provide piped input")
    file_contents = None
    if args.file:
        try:
            file_contents = open(args.file, "r").readlines()
        except IOError as e:
            die(f"Issue opening file {args.file}: {e}")
            print(output_text)
    else:
        file_contents = sys.stdin.readlines()

    tokens = TokenStack()
    in_comment = False
    new_config = []

    for line_num, line in enumerate(file_contents):
        if line.startswith("version ") or len(line) == 0:
            continue
        token = re.sub(r"^(.+?)#+[^\"]*$", r"\1", line.strip())
        token = token.strip()
        if (any(token.startswith(_) for _ in ["!", "#"])):
            # annotations currently not supported
            continue
    
        if token.startswith("/*"):
            # we're in a comment now until the next token (this will break if a multiline comment with # style { happens, but hopefully no-one is that dumb
            in_comment = True
            continue
    
        if "inactive: " in token:
            token = token.split("inactive: ")[1]
            new_config.append(f"deactivate {tokens} {token}")
        if token[-1] == "{":
            in_comment = False
            tokens.push(token.strip("{ "))
        elif token[-1] == "}":
            if not tokens.pop():
                die("Invalid json supplied: unmatched closing } encountered on line " + f"{line_num}")
        elif token[-1] == ";":
            new_config.append(f"set {tokens} {token[:-1]}")
    if tokens.peek():
        print(tokens)
        die("Unbalanced JSON: expected closing }, but encountered EOF")
    print("\n".join(new_config))

def die(msg): print(f"\n{B}{RED}FATAL ERROR{WHITE}: {msg}"); exit(1)
RED = "\033[31m"; GREEN = "\033[32m"; YELLOW = "\033[33m"; B = "\033[1m"; WHITE = "\033[0m"
if __name__ == "__main__": main()
