void __noreturn std::unexpected(void)
{
  void (*v0)(void); // x0

  do
    v0 = (void (*)(void))__ldaxr((unsigned __int64 *)&_cxa_unexpected_handler);
  while ( __stlxr((unsigned __int64)v0, (unsigned __int64 *)&_cxa_unexpected_handler) );
  sub_8EBE8(v0);
}
