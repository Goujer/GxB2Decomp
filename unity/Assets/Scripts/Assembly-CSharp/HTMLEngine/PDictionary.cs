using System.Collections.Generic;

namespace HTMLEngine
{
	internal class PDictionary<K, V> : PoolableObject
	{
		private readonly Dictionary<K, V> dict;

		public int Count
		{
			get
			{
				return 0;
			}
		}

		public IEnumerable<K> Keys
		{
			get
			{
				return null;
			}
		}

		public IEnumerable<V> Values
		{
			get
			{
				return null;
			}
		}

		public V Item
		{
			get
			{
				return default(V);
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

		public void Clear()
		{
		}
	}
}
