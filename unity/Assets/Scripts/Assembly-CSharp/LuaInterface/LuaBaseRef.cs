using System;

namespace LuaInterface
{
	public abstract class LuaBaseRef : IDisposable
	{
		public string name;

		protected int reference;

		protected LuaState luaState;

		protected ObjectTranslator translator;

		protected bool beDisposed;

		protected int count;

		public bool IsAlive;

		public LuaBaseRef()
		{
		}

		~LuaBaseRef()
		{
		}

		public virtual void Dispose()
		{
		}

		public void AddRef()
		{
		}

		public virtual void Dispose(bool disposeManagedResources)
		{
		}

		public void Dispose(int generation)
		{
		}

		public LuaState GetLuaState()
		{
			return null;
		}

		public void Push()
		{
		}

		public override int GetHashCode()
		{
			return 0;
		}

		public virtual int GetReference()
		{
			return 0;
		}

		public override bool Equals(object o)
		{
			return false;
		}

		private static bool CompareRef(LuaBaseRef a, LuaBaseRef b)
		{
			return false;
		}

		public static bool operator ==(LuaBaseRef a, LuaBaseRef b)
		{
			return false;
		}

		public static bool operator !=(LuaBaseRef a, LuaBaseRef b)
		{
			return false;
		}
	}
}
