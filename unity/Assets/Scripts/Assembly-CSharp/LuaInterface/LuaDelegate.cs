using System.Reflection;

namespace LuaInterface
{
	public class LuaDelegate
	{
		public LuaFunction func;

		public LuaTable self;

		public MethodInfo method;

		public LuaDelegate(LuaFunction func)
		{
		}

		public LuaDelegate(LuaFunction func, LuaTable self)
		{
		}

		public virtual void Dispose()
		{
		}

		public override bool Equals(object o)
		{
			return false;
		}

		private static bool CompareLuaDelegate(LuaDelegate a, LuaDelegate b)
		{
			return false;
		}

		public static bool operator ==(LuaDelegate a, LuaDelegate b)
		{
			return false;
		}

		public static bool operator !=(LuaDelegate a, LuaDelegate b)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
