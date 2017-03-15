# Client Network discovery functionality depends on the following services:
# DNS Client
# Function Discovery Resource Publication
# SSDP Discovery (Simple Service Discovery Protocol)
# UPnP Device Host

# Disable Network Discovery
netsh advfirewall firewall set rule group="Network Discovery" new enable=No
