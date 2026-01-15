# From the Deep

## Random Partitioning
Random partitioning ensures an excellent load balance across all nodes since observations are distributed uniformly. However, searching for a specific observation becomes highly inefficient as the system must perform a full scan across every single node to find the data.

## Partitioning by Hour
This method is highly effective for time-based queries, such as retrieving all observations from a specific hour. The downside is the risk of "hot nodes"; if most researchers conduct their observations during a specific time of day, that corresponding server will be overwhelmed while others remain idle.

## Partitioning by Hash Value
Partitioning by hash value (e.g., using `hash(observation_id) % N`) is often the most optimal approach. It provides a consistent spread of data to prevent hot nodes while allowing the system to immediately locate the correct node for any given ID without a full scan.
