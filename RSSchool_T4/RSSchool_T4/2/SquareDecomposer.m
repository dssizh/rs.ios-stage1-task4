#import "SquareDecomposer.h"

@implementation SquareDecomposer

- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    
    long num = [number longValue];
    long square = num*num;
    if (num < 0) {
        return nil;
    }
    
    NSMutableArray *result = [self decompose:number withRemain:[NSNumber numberWithLong:square]];
    if (result != nil) {
        [result removeLastObject];
    }
    return result;
}

- (NSMutableArray*)decompose:(NSNumber* )num withRemain:(NSNumber*)rem {
    if ([rem intValue] == 0) {
        NSMutableArray *result = [[NSMutableArray alloc] initWithObjects:num, nil];
        return result;
    }
    
    for (long i = [num longValue]-1; i > 0; i--) {
        long nRem = [rem longValue] - i*i;
        if (nRem >= 0) {
            NSMutableArray *result = [self decompose:[NSNumber numberWithLong:i] withRemain:[NSNumber numberWithLong:nRem]];
            if (result != nil) {
                [result addObject:num];
                return result;
            }
        }
    }
    return nil;
}

@end
