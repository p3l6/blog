---
title: Signposts
year: 2018
---
C API
```c
#inclucde <os/signpost.h>
os_log_create(), os_log_t
os_signpost_interval_begin
os_signpost_interval_end
os_signpost_event_emit
os_signpost_id_t
```

Instruments
signpost instrument
recording opitons > record mode: last 5 seconds (reduces load of signpost in app)

points of interest can mark very important events. they show up in time profiles as well

Custom Instrument
custom graphs
created in XML ~ 100 lines
