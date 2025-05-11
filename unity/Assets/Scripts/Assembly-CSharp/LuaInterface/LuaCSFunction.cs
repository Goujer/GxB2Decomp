using System;
using System.Runtime.InteropServices;

namespace LuaInterface
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate int LuaCSFunction(IntPtr luaState);
}
