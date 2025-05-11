using System;
using System.Collections.Generic;
using System.Reflection;

namespace LuaInterface
{
	public sealed class LuaConstructor
	{
		private ConstructorInfo method;

		private List<Type> list;

		[NoToLua]
		public LuaConstructor(ConstructorInfo func, Type[] types)
		{
		}

		public int Call(IntPtr L)
		{
			return 0;
		}

		public void Destroy()
		{
		}
	}
}
