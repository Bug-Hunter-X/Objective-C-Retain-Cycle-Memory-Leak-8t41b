# Objective-C Retain Cycle Memory Leak

This repository demonstrates a subtle memory leak in Objective-C caused by a retain cycle.  The example showcases a common scenario involving delegates where improper reference management leads to objects not being deallocated.  The solution introduces weak references to break the cycle and fix the memory leak.

**Problem:** A retain cycle occurs when two or more objects hold strong references to each other. This prevents the system from reclaiming the memory associated with those objects, leading to a memory leak.  The leak may not be immediately apparent and only manifest under specific conditions, making it challenging to diagnose.

**Solution:** Using `weak` references prevents the retain cycle.  By making one of the references weak, the cycle is broken, allowing objects to be deallocated when appropriate. This approach is central to avoiding memory issues in Objective-C's manual memory management paradigm.