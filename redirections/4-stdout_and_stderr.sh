#!/bin/bash
echo $2 > /tmp/4-stdout_and_stderr
$1 2>> /tmp/4-stdout_and_stderr
cat /tmp/4-stdout_and_stderr