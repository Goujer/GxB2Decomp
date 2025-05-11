void __fastcall std::__hash_table<std::__hash_value_type<char const*,xinyoudi::FileRef *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,xinyoudi::FileRef *>,hash_func,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,xinyoudi::FileRef *>,cmp,true>,std::allocator<std::__hash_value_type<char const*,xinyoudi::FileRef *>>>::__rehash(
        __int64 a1,
        unsigned __int64 a2)
{
  __int64 v4; // x0
  void *v5; // x8
  __int64 v6; // x8
  __int64 **v7; // x21
  unsigned __int64 v8; // x24
  __int64 v9; // x23
  void *v10; // x0
  __int64 *v11; // x8
  unsigned __int64 v12; // x25
  __int64 **v13; // x26
  __int64 **v14; // x27
  __int64 **v15; // x28
  __int64 **v16; // x22

  if ( a2 )
  {
    if ( a2 >> 61 )
      abort();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if ( v5 )
      operator delete(v5);
    v6 = 0LL;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0LL;
    while ( a2 != v6 );
    v7 = *(__int64 ***)(a1 + 16);
    if ( !v7 )
      return;
    v8 = (unsigned __int64)v7[1];
    v9 = (a2 - 1) & a2;
    if ( v9 )
    {
      if ( v8 >= a2 )
        v8 %= a2;
    }
    else
    {
      v8 &= a2 - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
    v11 = *v7;
    if ( !*v7 )
      return;
LABEL_18:
    v12 = v8;
    v13 = v7;
LABEL_19:
    v14 = v7;
    v7 = (__int64 **)v11;
    while ( 1 )
    {
      v8 = (unsigned __int64)v7[1];
      if ( v9 )
      {
        if ( v8 >= a2 )
        {
          v8 %= a2;
          if ( v8 == v12 )
            goto LABEL_31;
          goto LABEL_26;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      if ( v8 == v12 )
      {
LABEL_31:
        v11 = *v7;
        v13 = v7;
        if ( !*v7 )
          return;
        goto LABEL_19;
      }
LABEL_26:
      v15 = v7;
      if ( !*(_QWORD *)(*(_QWORD *)a1 + 8 * v8) )
      {
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = v14;
        v11 = *v7;
        if ( !*v7 )
          return;
        goto LABEL_18;
      }
      do
      {
        v16 = v15;
        v15 = (__int64 **)*v15;
      }
      while ( v15 && !strcmp((const char *)v7[2], (const char *)v15[2]) );
      *v14 = (__int64 *)v15;
      *v16 = **(__int64 ***)(*(_QWORD *)a1 + 8 * v8);
      **(_QWORD **)(*(_QWORD *)a1 + 8 * v8) = v7;
      v7 = (__int64 **)*v13;
      if ( !*v13 )
        return;
    }
  }
  v10 = *(void **)a1;
  *(_QWORD *)a1 = 0LL;
  if ( v10 )
    operator delete(v10);
  *(_QWORD *)(a1 + 8) = 0LL;
}
