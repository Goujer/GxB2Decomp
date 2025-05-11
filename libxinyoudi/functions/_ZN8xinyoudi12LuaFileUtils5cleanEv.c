void __fastcall xinyoudi::LuaFileUtils::clean(xinyoudi::LuaFileUtils *this)
{
  void **v2; // x20
  void **v3; // x21
  __int64 v4; // x8
  __int64 i; // x9

  if ( *((_QWORD *)this + 4) )
  {
    v2 = (void **)*((_QWORD *)this + 3);
    if ( v2 )
    {
      do
      {
        v3 = (void **)*v2;
        if ( ((_BYTE)v2[5] & 1) != 0 )
          operator delete(v2[7]);
        if ( ((_BYTE)v2[2] & 1) != 0 )
          operator delete(v2[4]);
        operator delete(v2);
        v2 = v3;
      }
      while ( v3 );
    }
    v4 = *((_QWORD *)this + 2);
    *((_QWORD *)this + 3) = 0LL;
    if ( v4 )
    {
      for ( i = 0LL; i != v4; ++i )
        *(_QWORD *)(*((_QWORD *)this + 1) + 8 * i) = 0LL;
    }
    *((_QWORD *)this + 4) = 0LL;
  }
}
