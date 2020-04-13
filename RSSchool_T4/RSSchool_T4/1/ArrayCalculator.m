#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    
    int result = 1;
    int count = 0;
    NSMutableArray *intArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i < array.count; i++) {
        if ([[array objectAtIndex:i] isKindOfClass:[NSNumber class]]) {
            count++;
            [intArray addObject:[array objectAtIndex:i]];
        }
    }
    
    if (count == 0) {
        return 0;
    }
    
    if (numberOfItems > count) {
        for (int i=0; i < intArray.count; i++) {
            result = result * [[intArray objectAtIndex:i] intValue];
        }
        
        return result;
    }
    
    [intArray sortUsingComparator:^(id obj1, id obj2) {
        
        int a = [obj1 intValue];
        int b = [obj2 intValue];
        
        if (a < 0) {
            a = a * -1;
        }
        
        if (b < 0) {
            b = b * -1;
        }
        
        if (a > b) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if (a < b) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    result = -1;
    int j = 0;
    while (result < 0 && intArray.count-numberOfItems-j >=0) {
        int r = 1;
        for (int i = 1; i <= numberOfItems; i++) {
            r = r * [[intArray objectAtIndex:intArray.count-i-j] intValue];
        }
        result = r;
        j++;
    }
    
    return result;
}

@end
