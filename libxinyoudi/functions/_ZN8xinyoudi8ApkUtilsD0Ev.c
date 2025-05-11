void __fastcall xinyoudi::ApkUtils::~ApkUtils(xinyoudi::ApkUtils *this)
{
  __int64 v2; // x0
  _QWORD *v3; // x0
  _QWORD *v4; // x20
  void *v5; // x0

  v2 = *((_QWORD *)this + 6);
  *(_QWORD *)this = off_69E88B0;
  if ( v2 )
    (*(void (__fastcall **)(__int64))(*(_QWORD *)v2 + 8LL))(v2);
  v3 = (_QWORD *)*((_QWORD *)this + 3);
  if ( v3 )
  {
    do
    {
      v4 = (_QWORD *)*v3;
      operator delete(v3);
      v3 = v4;
    }
    while ( v4 );
  }
  v5 = (void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0LL;
  if ( v5 )
    operator delete(v5);
  operator delete(this);
}
