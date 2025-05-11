using System;
using System.Collections;
using System.Collections.Generic;

namespace LuaInterface
{
	public class LuaArrayTable : IDisposable, IEnumerable<object>, IEnumerable
	{
		private class Enumerator : IEnumerator<object>, IEnumerator, IDisposable
		{
			private LuaState state;

			private int index;

			private object current;

			private int top;

			public object Current
			{
				get
				{
					return null;
				}
			}

			public Enumerator(LuaArrayTable list)
			{
			}

			public bool MoveNext()
			{
				return false;
			}

			public void Reset()
			{
			}

			public void Dispose()
			{
			}
		}

		private LuaTable table;

		private LuaState state;

		public int Length
		{
			get
			{
				return 0;
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

		public LuaArrayTable(LuaTable table)
		{
		}

		public void Dispose()
		{
		}

		public void ForEach(Action<object> action)
		{
		}

		public IEnumerator<object> GetEnumerator()
		{
			return null;
		}

		IEnumerator IEnumerable.GetEnumerator()
		{
			return null;
		}
	}
}
