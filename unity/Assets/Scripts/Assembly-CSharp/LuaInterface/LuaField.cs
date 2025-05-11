using System;
using System.Reflection;

namespace LuaInterface
{
	public sealed class LuaField
	{
		private FieldInfo field;

		private Type kclass;

		[NoToLua]
		public LuaField(FieldInfo info, Type t)
		{
		}

		public int Get(IntPtr L)
		{
			return 0;
		}

		public int Set(IntPtr L)
		{
			return 0;
		}
	}
}
