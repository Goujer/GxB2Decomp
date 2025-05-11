using System.Collections.Generic;

namespace HTMLEngine
{
	public sealed class OP<T> where T : PoolableObject, new()
	{
		public static readonly OP<T> Instance;

		private readonly Queue<T> _pool;

		private int _capacity;

		private readonly ObjectPoolHandler _returnHandler;

		public int Count
		{
			get
			{
				return 0;
			}
		}

		private OP(int capacity)
		{
		}

		private static T CreateInstance()
		{
			return null;
		}

		public static T Acquire()
		{
			return null;
		}

		private T AcquireInternal()
		{
			return null;
		}

		private void ReturnObject(PoolableObject obj)
		{
		}
	}
}
