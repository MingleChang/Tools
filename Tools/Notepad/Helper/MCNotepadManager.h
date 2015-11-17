//
//  MCNotepadManager.h
//  Tools
//
//  Created by cjw on 15/11/16.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MCNotepad;

@interface MCNotepadManager : NSObject
+(MCNotepadManager *)manager;

-(BOOL)createTable;
-(BOOL)insertNotepad:(MCNotepad *)notepad;
-(BOOL)updateNotepad:(MCNotepad *)notepad;
-(BOOL)deleteNotepad:(MCNotepad *)notepad;
-(NSArray *)selectAllNotepad;
@end
