void __noreturn sub_904A8()
{
  _QWORD **globals_fast; // x0
  _QWORD *v1; // x8
  unsigned __int64 v2; // x9
  _QWORD *v3; // x9
  const char **v4; // x20
  char *v5; // x19
  const char *v6; // x20
  const char *v7; // x0
  size_t v8; // [xsp+0h] [xbp-430h] BYREF
  char out[1024]; // [xsp+Ch] [xbp-424h] BYREF
  int status; // [xsp+40Ch] [xbp-24h] BYREF
  _QWORD *v11; // [xsp+418h] [xbp-18h]

  globals_fast = (_QWORD **)__cxa_get_globals_fast();
  if ( !globals_fast || (v1 = *globals_fast) == 0LL )
    sub_9035C("terminating");
  v2 = v1[12];
  if ( v2 >> 8 == 0x434C4E47432B2BLL )
  {
    if ( v2 == 0x434C4E47432B2B01LL )
      v3 = (_QWORD *)*v1;
    else
      v3 = v1 + 16;
    v11 = v3;
    v4 = (const char **)v1[1];
    v8 = 1024LL;
    v5 = __cxa_demangle(v4[1], out, &v8, &status);
    if ( status )
      v5 = (char *)v4[1];
    if ( (sub_B6770((int)&`typeinfo for'std::exception, v4) & 1) != 0 )
    {
      v6 = off_69EA020;
      v7 = (const char *)(*(__int64 (__fastcall **)(_QWORD *))(*v11 + 16LL))(v11);
      sub_9035C("terminating with %s exception of type %s: %s", v6, v5, v7);
    }
    sub_9035C("terminating with %s exception of type %s", off_69EA020, v5);
  }
  sub_9035C("terminating with %s foreign exception", off_69EA020);
}
