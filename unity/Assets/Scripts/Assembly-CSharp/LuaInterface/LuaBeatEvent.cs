using System;

namespace LuaInterface
{
	public class LuaBeatEvent : IDisposable
	{
		protected LuaState luaState;

		protected bool beDisposed;

		private LuaTable self;

		private LuaFunction _add;

		private LuaFunction _remove;

		public LuaBeatEvent(LuaTable table)
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
