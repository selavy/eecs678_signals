1. There are two special signals (KILL and STOP) which are not handled by
the process they are sent to.  When a KILL or STOP signal is generated,
the operating system itself handles this signal and kills or stops the
appropriate process.  Considering what you learned in today's lab, speculate
as gto why the system designers chose to include signals which are handled
soley by the operating system.

A: First, these signals provide a sort of backup: if the user needs to
   close the program, then he or she can send a KILL or STOP.  Second,
   the designer could mask all of the other signals, either unintentially
   or maliciously, and cause the program to not respond, or to act in a
   non-standard way, but with KILL and STOP, they should always act in a
   uniform way since the operating system is handling them.

2. What benefit do we gain from using the pause system call as opposed to
   an infinite while loop?
   
   A: Pause will sleep until a signal is caught, so it doesn't busy-wait
   like a while loop spin lock would do.

3. Why do we mask other signals while inside the signal handler?
   
   A: We want to be able to finish handling the signal before trying to
   handle another signal.  Otherwise we may end up in an unknown state if
   another signal is caught while we are in the middle of handling the last
   one.

4. When we implement the time out, we do not mask the SIGALRM signal. Why?

   A: If the SIGALRM signal was masked then we wouldn't be able to catch it
   while inside the SIGINT handler.