using System;
using System.Collections;

namespace PlatformSupport.Collections.Specialized
{
	internal sealed class ReadOnlyList : IList, IEnumerable, ICollection
	{
		private readonly IList _list;

		public int Count
		{
			get
			{
				return 0;
			}
		}

		public bool IsReadOnly
		{
			get
			{
				return false;
			}
		}

		public bool IsFixedSize
		{
			get
			{
				return false;
			}
		}

		public bool IsSynchronized
		{
			get
			{
				return false;
			}
		}

		public object Item
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public object SyncRoot
		{
			get
			{
				return null;
			}
		}

		internal ReadOnlyList(IList list)
		{
		}

		public int Add(object value)
		{
			return 0;
		}

		public void Clear()
		{
		}

		public bool Contains(object value)
		{
			return false;
		}

		public void CopyTo(Array array, int index)
		{
		}

		public IEnumerator GetEnumerator()
		{
			return null;
		}

		public int IndexOf(object value)
		{
			return 0;
		}

		public void Insert(int index, object value)
		{
		}

		public void Remove(object value)
		{
		}

		public void RemoveAt(int index)
		{
		}
	}
}
