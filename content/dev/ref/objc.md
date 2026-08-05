---
title: Objectice-C
---

## init <!-- Function -->

```objc
- (id) init {
    if ( ! (self = [super init]) ) return nil;
    // ...
    return self;
}
```

## dealloc <!-- Function -->

```objc
- (void) dealloc {
    // ...
    [super dealloc];
}

```

## Retain-release debug points <!-- Function -->

```objc
- (id)retain {
    return [super retain];
}
- (oneway void)release {
    [super release];
}
- (id)autorelease {
    return [super autorelease];
}
```

## Enumerator <!-- Macro -->

```objc
NSEnumerator * someEnumerator = [list objectEnumerator];
Some * item = nil;
while ((item = [someEnumerator nextObject])) {
  //...
}
```

## SNLog <!-- Macro -->

Like NSLog, but without all the timestamps etc. With and without trailing newlines.
Really, it behaves like printf, but takes the arguments of NSLog.

```objc
void SNLognb(NSString *format, ...)
{
    va_list args;
    va_start (args, format);
    NSString *string;
    string = [[NSString alloc] initWithFormat: format  arguments: args];
    va_end (args);
    printf ("%s", [string cString]);
    [string release];
}

void SNLog(NSString *format, ...)
{
    va_list args;
    va_start (args, format);
    NSString *string;
    string = [[NSString alloc] initWithFormat: format  arguments: args];
    va_end (args);
    printf ("%s\n", [string cString]);
    [string release];
}
```

## User default <!-- Setting -->

```objc
[[NSUserDefaults standardUserDefaults] boolForKey:@"orange"]
```

## Basic timing analysis  <!-- Macro -->

Setup code to time sections of code, wrapped with `startSection` and `endSection`.
Multiple sections can be compared at once.
Call `finishTiming` to end and flush the counters to debug log.

Essentially a multiple concurrent tic-toc.

```objc
static NSMutableDictionary * _times = nil;
static NSMutableDictionary * _starts = nil;
NSMutableDictionary * times() {
    if (!_times) _times = [[NSMutableDictionary alloc] init];
    return _times;
}
NSMutableDictionary * starts() {
    if (!_starts) _starts = [[NSMutableDictionary alloc] init];
    return _starts;
}

void restartTiming() {
    _times = nil;
    _starts = nil;
}

void startSection(NSString *name) {
     [starts() setObject:[NSDate date] forKey:name];
}

void endSection(NSString *name) {
     NSTimeInterval time = [[times() objectForKey:name] doubleValue];
      time +=  [[starts() objectForKey:name] timeIntervalUntilNow];
     [times() setObject:@(time) forKey:name];
}

void finishTiming() {
    NSTimeInterval total = 0;
    for (NSString * name in times().allKeys) {
        NSTimeInterval time = [[times() objectForKey:name] doubleValue];
        NSLog(@"%@ || %f seconds", name, time);
        total += time;
    }
    NSLog(@"total || %f", total);
}
```

## Tic Toc <!-- Macro -->

`tic` starts the stopwatch. `toc` prints the elapsed time since the tic.

```objc
static NSDate * _tic_toc_time;
#define tic _tic_toc_time = [NSDate date];
#define toclabel(title) NSLog(@"%@: %.3f seconds", @#title, [[NSDate date] timeIntervalSinceDate:_tic_toc_time]);
#define toc toclabel(toc)
```

## NSAlert modal wait <!-- Function -->

```objc
[dialog performSelectorOnMainThread:@selector(runModal:) withObject:[view window] waitUntilDone:TRUE];
BOOL ok = dialog.modalCode;
if (ok) {
  //...
}
```

## LLDB skip breakpoint <!-- Section -->

Use on a specific exception breakpoint to skip the pesky ones that keep coming up
`ignore_specified_objc_exceptions name:NSAccessibilityException className:NSSomeException`
