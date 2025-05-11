using System;
using System.Runtime.InteropServices;

namespace LuaInterface
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void LuaHookFunc(IntPtr L, ref Lua_Debug ar);
}
