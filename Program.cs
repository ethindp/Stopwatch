using System;
using System.Diagnostics;
using System.Threading;
using System.Collections;
using System.Linq;
using static System.Console;
namespace stopwatch {
public class Program {
private static Stopwatch timer = new Stopwatch();
public static void Main() {
WriteLine ("Stoplisten Read Execute Print Loop");
WriteLine ("Type 'h' for help. Type 'k' for a list of possible usable keys.");
EnterStopwatchRxpl();
}

private static void EnterStopwatchRxpl()
{
while (true)
{
Write ("> ");
ConsoleKeyInfo key = ReadKey(false);
switch (key.Key)
{
case ConsoleKey.S: {
WriteLine ();
WriteLine ("Timer Started.");
timer.Start();
}
break;
case ConsoleKey.T: {
WriteLine ();
timer.Stop();
WriteLine ("Timer stopped.");
}
break;
case ConsoleKey.R: {
WriteLine ();
timer.Stop();
timer.Reset();
WriteLine ("Timer Reset. Press S to start.");
}
break;
case ConsoleKey.D: {
WriteLine ();
TimeSpan ts = timer.Elapsed;
WriteLine ($"Current time: {ts:g}");
}
break;
case ConsoleKey.H: {
WriteLine ();
WriteLine ("Stoplisten - an interactive stopwatch.");
WriteLine ("This is an interactive stopwatch that tracks down to the very last tick of the CPU (or the very last tick of the last-run CPU instruction cycle). The following keys can be used in this application. Each key activates a specific function.");
WriteLine ("S - starts the stopwatch.");
WriteLine ("T - Stops the stopwatch.");
WriteLine ("R - Resets the stopwatch.");
WriteLine ("d - displays the currently tracked total time in the format [-][d':']h':'mm':'ss[.FFFFFFF].");
WriteLine ("f - does the same as the d key but always displays the number of days and seven fractional digits in the form [-]d':'hh':'mm':'ss.fffffff.");
WriteLine ("c - displays a constant (invariant) and culture-insensitive version of the time given by the d key in the form [-][d'.']hh':'mm':'ss['.'fffffff].");
WriteLine ("K - presents a list of keys available.");
WriteLine ("X - stops and resets the timer and then exits.");
WriteLine ("In the time forms listed above for the d, f, and c keys, the -, d, hh, mm, ss, FFFFFFF (or fffffff) and square brackets ([ and ]) have the following meanings:");
WriteLine ("-: An optional negative sign, which indicates a negative time interval.");
WriteLine ("d: The optional number of days, with no leading zeros.");
WriteLine ("hh: The number of hours, which ranges from '00' to '23'.");
WriteLine ("mm: The number of minutes, which ranges from '00' to '59'.");
WriteLine ("ss: The number of seconds, which ranges from '0' to '59'.");
WriteLine ("fffffff: The optional fractional portion of a second. Its value can range from '0000001' (one tick, or one ten-millionth of a second) to '9999999' (9,999,999 ten-millionths of a second, or one second less one tick).");
WriteLine ("[ and ]: indicates that an item is optional, i.e. the item may or may not show up in the time display.");
}
break;
case ConsoleKey.F: {
WriteLine ();
TimeSpan ts = timer.Elapsed;
WriteLine ($"Current time: {ts:G}");
}
break;
case ConsoleKey.C: {
WriteLine ();
TimeSpan ts = timer.Elapsed;
WriteLine ($"Current time: {ts:c}");
}
break;
case ConsoleKey.K: {
WriteLine ();
WriteLine ("S - starts the stopwatch.");
WriteLine ("T - Stops the stopwatch.");
WriteLine ("R - Resets the stopwatch.");
WriteLine ("d - displays the currently tracked total time in the format [-][d':']h':'mm':'ss[.FFFFFFF].");
WriteLine ("f - does the same as the d key but always displays the number of days and seven fractional digits in the form [-]d':'hh':'mm':'ss.fffffff.");
WriteLine ("c - displays a constant (invariant) and culture-insensitive version of the time given by the d key in the form [-][d'.']hh':'mm':'ss['.'fffffff].");
WriteLine ("K - presents a list of keys available.");
WriteLine ("X - stops and resets the timer and then exits.");
}
break;
case ConsoleKey.X: {
WriteLine ();
timer.Stop();
timer.Reset();
Environment.Exit (0);
}
break;
default: {
WriteLine ();
Beep();
WriteLine ($"Invalid key ({key.Key}). Try one of S, T, R, D, F, C, H, K, or X.");
}
break;
}
}
}
}
}
