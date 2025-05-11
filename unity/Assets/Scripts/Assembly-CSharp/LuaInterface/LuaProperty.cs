using System;
using System.Reflection;

namespace LuaInterface
{
	public sealed class LuaProperty
	{
		private PropertyInfo property;

		private Type kclass;

		[NoToLua]
		public LuaProperty(PropertyInfo prop, Type t)
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
