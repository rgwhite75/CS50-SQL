# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

This method keeps each boat from becoming overloaded with excessive data, though it can slow down data retrieval since the search has to scan through every boat’s records.

## Partitioning by Hour

This strategy speeds up search queries by keeping data confined to specific boats, but it also increases the risk that one boat becomes overloaded and forces the data to spill over into another.

## Partitioning by Hash Value

This method avoids overloading any single boat with excessive data and keeps lookups for specific values fast. However, searching across all data becomes slower because every value in the range must be hashed, and the query often ends up scanning each boat.
