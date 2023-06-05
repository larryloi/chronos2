## Version 0.2.0

### Scope of changes

|**Subject**|**Description**|
|:------------------------------------|:--------------------------------|
|**ETL Source checking tuning**  | Improve query time while ETL job check the source tables sync time |


>**Change Details**

- Added new table chronos_traces for store the current source table sync time
- update lib/chronos2/interactors/archive_operations/save_trace_log.rb upsert sync time for each archived jobs

>**Dependency**
- None
----

