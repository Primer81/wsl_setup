" File: c.vim
" Author: Ethan Larkham
" Description: Extended C syntax for AIC Types

"-- Types

" Unsigned Integers
syn keyword cType u8 u16 u32 u64

" Signed Integers
syn keyword cType s8 s16 s32 s64

" Floats
syn keyword cType f32 f64 f96

" Extra
syn keyword cType flag fresult t_relation

syn match   cType "\<[a-zA-Z_][a-zA-Z0-9_]*_[t]\>"

"-- Constants

" Results
syn keyword cConstant failure success

" flags
syn keyword cConstant clr off no set on yes

" t_relation
syn keyword cConstant TR_LESS TR_EQUAL TR_GREATER

" Order_t
syn keyword cConstant GTE LTE LT GT EQ
