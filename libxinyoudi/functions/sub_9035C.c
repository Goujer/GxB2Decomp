void __noreturn sub_9035C(char *format, ...)
{
  gcc_va_list va2; // [xsp+C0h] [xbp-E0h] BYREF
  gcc_va_list va; // [xsp+E8h] [xbp-B8h] BYREF
  char *ptr; // [xsp+108h] [xbp-98h] BYREF
  gcc_va_list arg; // [xsp+110h] [xbp-90h] BYREF
  gcc_va_list va1; // [xsp+130h] [xbp-70h] BYREF

  va_start(va, format);
  va_start(va1, format);
  va_copy(arg, va1);
  vfprintf((FILE *)((char *)&_sF + 304), format, arg);
  fputc(10, (FILE *)((char *)&_sF + 304));
  va_copy(va2, va);
  vasprintf(&ptr, format, va2);
  android_set_abort_message();
  openlog("libc++abi", 0, 0);
  syslog(2, "%s", ptr);
  closelog();
  abort();
}
