.PHONY : all help show_config run

UV := uv
PYTHON := $(UV) run python

all: help

help:
	@echo "Makefile"
	@echo "Usage:"
	@echo "  make help				- Show this help message"
	@echo "  make setup				- Install dependencies"
	@echo "  make show_config	- Show the configuration"
	@echo "  make run					- Run the Python script"

setup:
	@$(UV) sync --locked --all-extras

show_config:
	@echo "Please run maually:"
	@echo "  echo \"ip=0.0.0.0\\nport=11573\" >> \"/path/tp/Vtube\\ Studio_Data/StreamingAssets/ip.txt\""

ENTRY := facetracker.py
ARGS := -W 1280 -H 720 --discard-after 0 --scan-every 0 --no-3d-adapt 1 --max-feature-updates 900

run:
	@$(PYTHON) $(ENTRY) $(ARGS)
