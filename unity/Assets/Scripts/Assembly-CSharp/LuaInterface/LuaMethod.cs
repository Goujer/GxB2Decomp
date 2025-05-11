using System;
using System.Collections.Generic;
using System.Reflection;

namespace LuaInterface
{
	public sealed class LuaMethod
	{
		private MethodInfo method;

		private List<Type> list;

		private Type kclass;

		[NoToLua]
		public LuaMethod(MethodInfo md, Type t, Type[] types)
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
