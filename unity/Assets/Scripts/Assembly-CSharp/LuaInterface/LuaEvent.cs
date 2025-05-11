using System;

namespace LuaInterface
{
	public class LuaEvent : IDisposable
	{
		protected LuaState luaState;

		protected bool beDisposed;

		private LuaTable self;

		private LuaFunction _add;

		private LuaFunction _remove;

		public LuaEvent(LuaTable table)
		{
		}

		public void Dispose()
		{
		}

		private void Clear()
		{
		}

		public void Dispose(bool disposeManagedResources)
		{
		}

		public void Add(LuaFunction func, LuaTable obj)
		{
		}

		public void Remove(LuaFunction func, LuaTable obj)
		{
		}
	}
}
