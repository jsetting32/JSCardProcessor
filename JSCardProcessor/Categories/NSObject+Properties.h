//
//  NSObject+Properties.h
//  JSUtility
//
//  Created by John Setting on 8/30/16.
//  Copyright © 2016 John Setting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Properties)
- (NSDictionary *)propertiesOfObject;
+ (NSDictionary *)propertiesOfClass:(Class)classObject;
+ (NSDictionary *)propertiesOfSubclass:(Class)classObject;
<<<<<<< HEAD
- (void)performSelector:(SEL)selector argument:(id)argument;
=======
>>>>>>> 6ae239243ac6e845364ddc8c7b5e096e3fb81d22
@end
