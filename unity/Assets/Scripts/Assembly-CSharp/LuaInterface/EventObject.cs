using System;

namespace LuaInterface
{
	public class EventObject
	{
		[NoToLua]
		public EventOp op;

		[NoToLua]
		public Delegate func;

		[NoToLua]
		public Type type;

		[NoToLua]
		public EventObject(Type t)
		{
		}

		public static EventObject operator +(EventObject a, Delegate b)
		{
			return null;
		}

		public static EventObject operator -(EventObject a, Delegate b)
		{
			return null;
		}
	}
}
