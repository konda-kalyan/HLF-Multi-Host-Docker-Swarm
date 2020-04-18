#!/bin/bash

./generate_crypto.sh
./populate_hostname.sh
./copy_crypto.sh
./scp_to_worker_nodes_and_copy_to_common_dir.sh
