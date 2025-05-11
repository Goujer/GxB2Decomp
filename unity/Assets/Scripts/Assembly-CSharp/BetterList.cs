using System.Collections.Generic;
using System.Diagnostics;

public class BetterList<T>
{
	public delegate int CompareFunc(T left, T right);

	public T[] buffer;

	public int size;

	[DebuggerHidden]
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

	[DebuggerHidden]
	[DebuggerHidden]
	[DebuggerStepThrough]
	public IEnumerator<T> GetEnumerator()
	{
		return null;
	}

	private void AllocateMore()
	{
	}

	public void AllocateNew(int newSize)
	{
	}

	private void Trim()
	{
	}

	public void Clear()
	{
	}

	public void Release()
	{
	}

	public void Add(T item)
	{
	}

	public void Insert(int index, T item)
	{
	}

	public bool Contains(T item)
	{
		return false;
	}

	public int IndexOf(T item)
	{
		return 0;
	}

	public bool Remove(T item)
	{
		return false;
	}

	public void RemoveAt(int index)
	{
	}

	public T Pop()
	{
		return default(T);
	}

	public T[] ToArray()
	{
		return null;
	}

	[DebuggerHidden]
	[DebuggerStepThrough]
	public void Sort(CompareFunc comparer)
	{
	}
}
