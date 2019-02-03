#!/usr/bin/bash

# Exit on error
set -e

# Improve readability of output
echo "========================================================================================="
echo "===>"
echo "===> Running $0"
echo "===> Install Spectrum Scale and create a Spectrum Scale cluster"
echo "===>"
echo "========================================================================================="

# Print commands and their arguments as they are executed
set -x

# Exit script immediately, if one of the commands returns error code
set -e


# Install Spectrum Scale and create Spectrum Scale cluster
echo "===> Install Spectrum Scale and create Spectrum Scale cluster"
sudo /usr/lpp/mmfs/5.0.2.2/installer/spectrumscale install

## Change admin interface
#  Note: Disable configuration of separate admin network, because
#        this requires reconfiguration of Zimon Collector.
#echo "==> Change admin interface"
#sudo mmchnode -N m1 --admin-interface m1m.example.com

# Show cluster configuration
echo "===> Show cluster configuration"
sudo mmlscluster

# Show node state
echo "===> Show node state"
sudo mmgetstate -a

# Show cluster health
echo "===> Show cluster health"
sudo mmhealth cluster show

# Show node health
echo "===> Show node health"
sudo mmhealth node show

# Show NSDs
echo "===> Show NSDs"
sudo mmlsnsd


# Exit successfully
echo "===> Script completed successfully!"
exit 0
