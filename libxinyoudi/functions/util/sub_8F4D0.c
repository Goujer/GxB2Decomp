void __fastcall __noreturn sub_8F4D0(char a1, void *a2)
{
  __cxa_begin_catch(a2);
  if ( (a1 & 1) != 0 )
    sub_8EC38(*((void (**)(void))a2 - 8));
  std::terminate();
}
