
#> universal_manual:v1.0.0/update_manual/add_selected_manual
#
# @within	universal_manual:v1.0.0/update_manual/write_manual
#

# Add the pages to the manual (not the first one)
data remove storage universal_manual:main extracted_pages[0]
data modify storage universal_manual:main pages append from storage universal_manual:main extracted_pages[]

