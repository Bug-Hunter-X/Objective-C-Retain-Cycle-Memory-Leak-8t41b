The solution involves replacing the strong reference in the delegate property with a `weak` reference. This ensures that the delegate object is not retained by the data source, breaking the retain cycle and enabling the objects to be deallocated appropriately.

```objectivec
// MemoryLeakSolution.h
#import <Foundation/Foundation.h>

@protocol MyDelegate <NSObject>
- (void)dataChanged:(id)data;
@end

@interface MyDataSource : NSObject
@property (weak) id <MyDelegate> delegate; // changed to weak
- (void)sendData:(id)data;
@end

// MemoryLeakSolution.m
#import "MemoryLeakSolution.h"

@implementation MyDataSource
- (void)sendData:(id)data {
  [self.delegate dataChanged:data];
}
@end
```
By using `weak`, the `delegate` property doesn't retain the object it points to, effectively breaking the retain cycle.