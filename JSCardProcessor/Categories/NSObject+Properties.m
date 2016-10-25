//
//  NSObject+Properties.m
//  JSUtility
//
//  Created by John Setting on 8/30/16.
//  Copyright © 2016 John Setting. All rights reserved.
//

#import "NSObject+Properties.h"

#import <objc/runtime.h>

@implementation NSObject (Properties)

- (NSDictionary *)propertiesOfObject {
    Class class = [self class];
    return [NSObject propertiesOfClass:class];
}

+ (NSDictionary *) propertiesOfClass:(Class)classObject {
    NSMutableDictionary * properties = [NSMutableDictionary dictionary];
    [self propertiesForHierarchyOfClass:classObject onDictionary:properties];
    return [NSDictionary dictionaryWithDictionary:properties];
}

+ (NSDictionary *) propertiesOfSubclass:(Class)classObject {
    if (classObject == NULL) {
        return nil;
    }
    
    NSMutableDictionary *properties = [NSMutableDictionary dictionary];
    return [self propertiesForSubclass:classObject onDictionary:properties];
}

- (NSMutableDictionary *)propertiesForHierarchyOfClass:(Class)class onDictionary:(NSMutableDictionary *)properties {
    if (class == NULL) {
        return nil;
    }
    
    if (class == [NSObject class]) {
        // On reaching the NSObject base class, return all properties collected.
        return properties;
    }
    
    // Collect properties from the current class.
    [self propertiesForSubclass:class onDictionary:properties];
    
    // Collect properties from the superclass.
    return [self propertiesForHierarchyOfClass:[class superclass] onDictionary:properties];
}

- (NSMutableDictionary *) propertiesForSubclass:(Class)class onDictionary:(NSMutableDictionary *)properties {
    unsigned int outCount, i;
    objc_property_t *objcProperties = class_copyPropertyList(class, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = objcProperties[i];
        const char *propName = property_getName(property);
        if(propName) {
            const char *propType = getPropertyType(property);
            NSString *propertyName = [NSString stringWithUTF8String:propName];
            NSString *propertyType = [NSString stringWithUTF8String:propType];
            [properties setObject:propertyType forKey:propertyName];
        }
    }
    free(objcProperties);
    
    return properties;
}

static const char *getPropertyType(objc_property_t property) {
    const char *attributes = property_getAttributes(property);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T' && attribute[1] != '@') {
            // A C primitive type:
            /*
             For example, int "i", long "l", unsigned "I", struct.
             Apple docs list plenty of examples of values returned. For a list
             of what will be returned for these primitives, search online for
             "Objective-c" "Property Attribute Description Examples"
             */
            NSString *name = [[NSString alloc] initWithBytes:attribute + 1 length:strlen(attribute) - 1 encoding:NSASCIIStringEncoding];
            return (const char *)[name cStringUsingEncoding:NSASCIIStringEncoding];
        }
        else if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) == 2) {
            // An Objective C id type:
            return "id";
        }
        else if (attribute[0] == 'T' && attribute[1] == '@') {
            // Another Objective C id type:
            NSString *name = [[NSString alloc] initWithBytes:attribute + 3 length:strlen(attribute) - 4 encoding:NSASCIIStringEncoding];
            return (const char *)[name cStringUsingEncoding:NSASCIIStringEncoding];
        }
    }
    return "";
}

<<<<<<< HEAD
- (void)performSelector:(SEL)selector argument:(id)argument {
    typedef void (*send_type)(void*, SEL, void*);
    send_type methodInstance = (send_type)[[self class] instanceMethodForSelector:selector];
    methodInstance((__bridge void *)(self), selector, (__bridge void *)(argument));
}


=======
>>>>>>> 6ae239243ac6e845364ddc8c7b5e096e3fb81d22
@end
