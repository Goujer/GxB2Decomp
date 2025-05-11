using System.Collections.Generic;

namespace HTMLEngine
{
	internal class PList<T> : PoolableObject
	{
		protected readonly List<T> list;

		public int Count
		{
			get
			{
				return 0;
			}
		}

		public IEnumerable<T> Items
		{
			get
			{
				return null;
			}
		}

		public T Item
		{
			get
			{
				return default(T);
			}
			set
			{
			}
		}

		internal override void OnAcquire()
		{
		}

		internal override void OnRelease()
		{
		}

		public void Add(T value)
		{
		}

		public IEnumerator<T> GetEnumerator()
		{
			return null;
		}

		public override string ToString()
		{
			return null;
		}
	}
}
