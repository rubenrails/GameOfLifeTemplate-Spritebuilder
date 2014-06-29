//
//  Grid.m
//  GameOfLife
//
//  Created by Ruben Ascencio on 6/28/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"


static const int GridRows = 8;
static const int GridColumns = 10;

@implementation Grid {
    NSMutableArray *_gridArray;
    float _cellWidth;
    float _cellHeight;
}

- (void)onEnter
{
    [super onEnter];
    [self setupGrid];

    self.userInteractionEnabled = YES;
}

- (void)setupGrid
{
    // divide the grid's size by the number of columns/rows to figure out the right width and height of each cell
    _cellWidth = self.contentSize.width / GridColumns;
    _cellHeight = self.contentSize.height / GridRows;

    float x = 0;
    float y = 0;

    // initialize the array as a blank NSMutableArray
    _gridArray = [NSMutableArray array];

    // initialize Creatures
    for (int i = 0; i < GridRows; i++) {
        // this is how you create two dimensional arrays in Objective-C. You put arrays into arrays.
        _gridArray[i] = [NSMutableArray array];
        x = 0;

        for (int j = 0; j < GridColumns; j++) {
            Creature *creature = [[Creature alloc] initCreature];
            creature.anchorPoint = ccp(0, 0);
            creature.position = ccp(x, y);
            [self addChild:creature];

            // this is shorthand to access an array inside an array
            _gridArray[i][j] = creature;

            // make creatures visible to test this method, remove this once we know we have filled the grid properly
            creature.isAlive = YES;
            
            x+=_cellWidth;
        }
        
        y += _cellHeight;
    }
}

@end
