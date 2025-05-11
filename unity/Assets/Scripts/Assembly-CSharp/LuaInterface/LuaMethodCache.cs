using System;
using System.Collections.Generic;
using System.Reflection;

namespace LuaInterface
{
	public static class LuaMethodCache
	{
		public static Dictionary<Type, Dictionary<string, List<MethodInfo>>> dict;

		private static MethodInfo GetMethod(Type t, string name, Type[] ts)
		{
			return null;
		}

		public static object CallSingleMethod(string name, object obj, params object[] args)
		{
			return null;
		}

		public static object CallMethod(string name, object obj, params object[] args)
		{
			return null;
		}
	}
}
