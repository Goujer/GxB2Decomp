void __fastcall std::domain_error::~domain_error(std::domain_error *this)
{
  __int64 v2; // x8
  unsigned int *v3; // x9
  unsigned int v4; // w10
  unsigned int v5; // w10

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_69E8A70;
  v3 = (unsigned int *)(v2 - 8);
  do
  {
    v4 = __ldaxr(v3);
    v5 = v4 - 1;
  }
  while ( __stlxr(v5, v3) );
  if ( (v5 & 0x80000000) != 0 )
    operator delete((void *)(v2 - 24));
  std::exception::~exception(this);
  operator delete(this);
}
