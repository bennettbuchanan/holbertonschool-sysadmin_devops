#!/bin/bash

# Create the file and change its ownership.
touch /tmp/permissions
chmod 664 /tmp/permissions
sudo chown nobody /tmp/permissions
