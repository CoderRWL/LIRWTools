//
//  STD.hpp
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#ifndef STD_hpp
#define STD_hpp
#include <stdio.h>

class STD {
    
    
public:
    
    /// 重写系统strcpy,因为系统此函数没有进行长度检测，不安全
    /// @param num  dst的s长度
    static char* strcpy_s(char* dst, const char* src, size_t num, char end = '\0');
    
    /// 重写系统strcat,因为系统此函数没有进行长度检测，不安全
    ///dst 如果是个k没有初始化的指针是有问题的，要传一个赋了值的指针
    /// @param num dst的s长度
    static char*    strcat_s(char* dst, const char* src, size_t num);
};

#endif /* STD_hpp */
