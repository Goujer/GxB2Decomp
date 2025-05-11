using System.Collections.Generic;

namespace Spine
{
	public class Pool<T> where T : class, new()
	{
		public interface IPoolable
		{
			void Reset();
		}

		public readonly int max;

		private readonly Stack<T> freeObjects;

		public int Count
		{
			get
			{
				return 0;
			}
		}

		public int Peak { get; private set; }

		public Pool(int initialCapacity = 16, int max = int.MaxValue)
		{
		}

		public T Obtain()
		{
			return null;
		}

		public void Free(T obj)
		{
		}

		public void Clear()
		{
		}

		protected void Reset(T obj)
		{
		}
	}
}
