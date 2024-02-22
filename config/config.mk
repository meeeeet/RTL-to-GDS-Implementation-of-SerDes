export DESIGN_NAME = ser_top
export PLATFORM    = asap7
export DESIGN_NICKNAME = Ser

export VERILOG_FILES = $(sort $(wildcard ./designs/src/$(DESIGN_NICKNAME)/*.v))
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

#export MERGED_LEF = $(PLATFORM_DIR)/NangateOpenCellLibrary.mod.lef
#export LIB_FILES  = $(PLATFORM_DIR)/NangateOpenCellLibrary_typical.lib
#export GDS_FILES  = $(sort $(wildcard $(PLATFORM_DIR)/gds/*))


# Automatically pick a reasonable area and utilization
export ABC_SPEED=1
# Core utilization in %
export CORE_UTILIZATION = 30
# Core height / core width
export CORE_ASPECT_RATIO = 1
# Core margin in um
export CORE_MARGIN = 1

