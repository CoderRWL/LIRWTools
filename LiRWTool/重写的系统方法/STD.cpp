//
//  STD.cpp
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#include "STD.hpp"
#include <string.h>

char* STD::strcpy_s(char *dst, const char *src, size_t num,char end){
    const char* psrc = src;
    char* pdst = dst;
    
    num--;
    while (num > 0)
    {
        char c = *psrc;
        if (c == end || c == '\0')
        {
            *pdst    = '\0';
            break;
        }
        *pdst    = c;
        psrc++;
        pdst++;
        num--;
    }
    
    return dst;
}

char*  STD::strcat_s(char *dst, const char *src, size_t num){
    size_t dL = strlen(dst);
    const char* psrc = src;
    char* pdst = dst+dL;
    size_t len = num-dL;
    len--;
    while (len > 0)
    {
        char c = *psrc;
        if ( c == '\0')
        {
            *pdst    = '\0';
            break;
        }
        *pdst    = c;
        psrc++;
        pdst++;
        len--;
    }
    
    
    return dst;
}
