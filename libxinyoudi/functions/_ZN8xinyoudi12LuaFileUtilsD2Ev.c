void __fastcall xinyoudi::LuaFileUtils::~LuaFileUtils(xinyoudi::LuaFileUtils *this)
{
  __int64 v2; // x8
  void **v3; // x20
  void **v4; // x21
  __int64 v5; // x8
  __int64 i; // x9
  void **v7; // x20
  void **v8; // x21
  void *v9; // x0

  v2 = *((_QWORD *)this + 4);
  *(_QWORD *)this = off_69E88F0;
  if ( v2 )
  {
    v3 = (void **)*((_QWORD *)this + 3);
    if ( v3 )
    {
      do
      {
        v4 = (void **)*v3;
        if ( ((_BYTE)v3[5] & 1) != 0 )
          operator delete(v3[7]);
        if ( ((_BYTE)v3[2] & 1) != 0 )
          operator delete(v3[4]);
        operator delete(v3);
        v3 = v4;
      }
      while ( v4 );
    }
    v5 = *((_QWORD *)this + 2);
    *((_QWORD *)this + 3) = 0LL;
    if ( v5 )
    {
      for ( i = 0LL; i != v5; ++i )
        *(_QWORD *)(*((_QWORD *)this + 1) + 8 * i) = 0LL;
    }
    *((_QWORD *)this + 4) = 0LL;
  }
  v7 = (void **)*((_QWORD *)this + 3);
  if ( v7 )
  {
    do
    {
      v8 = (void **)*v7;
      if ( ((_BYTE)v7[5] & 1) != 0 )
        operator delete(v7[7]);
      if ( ((_BYTE)v7[2] & 1) != 0 )
        operator delete(v7[4]);
      operator delete(v7);
      v7 = v8;
    }
    while ( v8 );
  }
  v9 = (void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0LL;
  if ( v9 )
    operator delete(v9);
}
