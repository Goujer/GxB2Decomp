using System;

namespace HTMLEngine
{
	public abstract class PoolableObject : IDisposable
	{
		private ObjectPoolHandler _handler;

		internal void SetPoolHandler(ObjectPoolHandler handler)
		{
		}

		internal abstract void OnAcquire();

		internal abstract void OnRelease();

		public void Dispose()
		{
		}

		~PoolableObject()
		{
		}
	}
}
