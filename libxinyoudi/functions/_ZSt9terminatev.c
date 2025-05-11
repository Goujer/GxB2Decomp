void __noreturn std::terminate(void)
{
  __int64 *globals_fast; // x0
  __int64 v1; // x8
  void (*terminate)(void); // x0

  globals_fast = (__int64 *)__cxa_get_globals_fast();
  if ( globals_fast )
  {
    v1 = *globals_fast;
    if ( *globals_fast )
    {
      if ( *(_QWORD *)(v1 + 96) >> 8 == 0x434C4E47432B2BLL )
        sub_8EC38(*(void (**)(void))(v1 + 32));
    }
  }
  terminate = (void (*)(void))std::get_terminate();
  sub_8EC38(terminate);
}
