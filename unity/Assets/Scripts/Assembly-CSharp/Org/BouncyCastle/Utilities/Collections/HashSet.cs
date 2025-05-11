using System;
using System.Collections;

namespace Org.BouncyCastle.Utilities.Collections
{
	public class HashSet : ISet, ICollection, IEnumerable
	{
		private readonly IDictionary impl;

		public virtual int Count
		{
			get
			{
				return 0;
			}
		}

		public virtual bool IsEmpty
		{
			get
			{
				return false;
			}
		}

		public virtual bool IsFixedSize
		{
			get
			{
				return false;
			}
		}

		public virtual bool IsReadOnly
		{
			get
			{
				return false;
			}
		}

		public virtual bool IsSynchronized
		{
			get
			{
				return false;
			}
		}

		public virtual object SyncRoot
		{
			get
			{
				return null;
			}
		}

		public HashSet()
		{
		}

		public HashSet(IEnumerable s)
		{
		}

		public virtual void Add(object o)
		{
		}

		public virtual void AddAll(IEnumerable e)
		{
		}

		public virtual void Clear()
		{
		}

		public virtual bool Contains(object o)
		{
			return false;
		}

		public virtual void CopyTo(Array array, int index)
		{
		}

		public virtual IEnumerator GetEnumerator()
		{
			return null;
		}

		public virtual void Remove(object o)
		{
		}

		public virtual void RemoveAll(IEnumerable e)
		{
		}
	}
}
